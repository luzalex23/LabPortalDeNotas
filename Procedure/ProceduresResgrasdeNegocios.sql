/*EXECUTAR CADA PROCEDURE POR VEZ, CASO CONTRÁRIO VAI DA ERRO ERRO*/


--procedures crud usuario
CREATE PROCEDURE CriarUsuario
  @Email NVARCHAR(100),
  @Login NVARCHAR(50),
  @Senha NVARCHAR(255),
  @Tipo NVARCHAR(20)
AS
BEGIN
  INSERT INTO Usuario (Email, Login, Senha, Tipo)
  VALUES (@Email, @Login, @Senha, @Tipo)
END;

CREATE PROCEDURE LerUsuario
  @UsuarioID INT
AS
BEGIN
  SELECT * FROM Usuario WHERE ID = @UsuarioID
END;

CREATE PROCEDURE AtualizarUsuario
  @UsuarioID INT,
  @Email NVARCHAR(100),
  @Login NVARCHAR(50),
  @Senha NVARCHAR(255),
  @Tipo NVARCHAR(20)
AS
BEGIN
  UPDATE Usuario
  SET Email = @Email,
      Login = @Login,
      Senha = @Senha,
      Tipo = @Tipo
  WHERE ID = @UsuarioID
END;

CREATE PROCEDURE DeletarUsuario
  @UsuarioID INT
AS
BEGIN
  DELETE FROM Usuario WHERE ID = @UsuarioID
END;

-----Matéria CRUD Procedures

CREATE PROCEDURE CriarMateria
  @Nome NVARCHAR(100)
AS
BEGIN
  INSERT INTO Materia (Nome)
  VALUES (@Nome)
END;

CREATE PROCEDURE LerMateria
  @MateriaID INT
AS
BEGIN
  SELECT * FROM Materia WHERE ID = @MateriaID
END;

CREATE PROCEDURE AtualizarMateria
  @MateriaID INT,
  @Nome NVARCHAR(100)
AS
BEGIN
  UPDATE Materia
  SET Nome = @Nome
  WHERE ID = @MateriaID
END;

CREATE PROCEDURE DeletarMateria
  @MateriaID INT
AS
BEGIN
  DELETE FROM Materia WHERE ID = @MateriaID
END;

------Curso CRUD Procedures
CREATE PROCEDURE CriarCurso
  @Nome NVARCHAR(100)
AS
BEGIN
  INSERT INTO Curso (Nome)
  VALUES (@Nome)
END;

CREATE PROCEDURE LerCurso
  @CursoID INT
AS
BEGIN
  SELECT * FROM Curso WHERE ID = @CursoID
END;

CREATE PROCEDURE AtualizarCurso
  @CursoID INT,
  @Nome NVARCHAR(100)
AS
BEGIN
  UPDATE Curso
  SET Nome = @Nome
  WHERE ID = @CursoID
END;

CREATE PROCEDURE DeletarCurso
  @CursoID INT
AS
BEGIN
  DELETE FROM Curso WHERE ID = @CursoID
END;

-----Aluno CRUD Procedures:
CREATE PROCEDURE CriarAluno
  @Nome NVARCHAR(100),
  @CursoID INT,
  @UsuarioID INT
AS
BEGIN
  INSERT INTO Aluno (Nome, CursoID, UsuarioID)
  VALUES (@Nome, @CursoID, @UsuarioID)
END;

CREATE PROCEDURE LerAluno
  @AlunoID INT
AS
BEGIN
  SELECT * FROM Aluno WHERE ID = @AlunoID
END;

CREATE PROCEDURE AtualizarAluno
  @AlunoID INT,
  @Nome NVARCHAR(100),
  @CursoID INT,
  @UsuarioID INT
AS
BEGIN
  UPDATE Aluno
  SET Nome = @Nome,
      CursoID = @CursoID,
      UsuarioID = @UsuarioID
  WHERE ID = @AlunoID
END;

CREATE PROCEDURE DeletarAluno
  @AlunoID INT
AS
BEGIN
  DELETE FROM Aluno WHERE ID = @AlunoID
END;

---------Professor CRUD Procedures:

CREATE PROCEDURE CriarProfessor
  @Nome NVARCHAR(100),
  @MateriaID INT,
  @UsuarioID INT
AS
BEGIN
  INSERT INTO Professor (Nome, MateriaID, UsuarioID)
  VALUES (@Nome, @MateriaID, @UsuarioID)
END;

CREATE PROCEDURE LerProfessor
  @ProfessorID INT
AS
BEGIN
  SELECT * FROM Professor WHERE ID = @ProfessorID
END;

CREATE PROCEDURE AtualizarProfessor
  @ProfessorID INT,
  @Nome NVARCHAR(100),
  @MateriaID INT,
  @UsuarioID INT
AS
BEGIN
  UPDATE Professor
  SET Nome = @Nome,
      MateriaID = @MateriaID,
      UsuarioID = @UsuarioID
  WHERE ID = @ProfessorID
END;

CREATE PROCEDURE DeletarProfessor
  @ProfessorID INT
AS
BEGIN
  DELETE FROM Professor WHERE ID = @ProfessorID
END;

--------Stored Procedure para Lançamento de Notas

CREATE PROCEDURE LancaNotas
  @AlunoId INT,
  @MateriaId INT,
  @Unidade1 FLOAT,
  @Unidade2 FLOAT = NULL,
  @Unidade3 FLOAT = NULL,
  @Unidade4 FLOAT = NULL
AS
BEGIN
  DECLARE @MediaFinal FLOAT
  DECLARE @Situacao NVARCHAR(20)

  -- Calcula a média final com base nas unidades inseridas
  SET @MediaFinal = (ISNULL(@Unidade1, 0) + ISNULL(@Unidade2, 0) + ISNULL(@Unidade3, 0) + ISNULL(@Unidade4, 0)) /
                    (CASE 
                       WHEN @Unidade4 IS NOT NULL THEN 4
                       WHEN @Unidade3 IS NOT NULL THEN 3
                       WHEN @Unidade2 IS NOT NULL THEN 2
                       ELSE 1
                     END)

  -- Verifica a situação do aluno
  IF @MediaFinal >= 7
    SET @Situacao = 'Aprovado'
  ELSE
    SET @Situacao = 'Reprovado'

  -- Atualiza a tabela de notas
  UPDATE Notas
  SET Unidade1 = @Unidade1,
      Unidade2 = @Unidade2,
      Unidade3 = @Unidade3,
      Unidade4 = @Unidade4,
      MediaFinal = @MediaFinal,
      Situacao = @Situacao
  WHERE AlunoId = @AlunoId AND MateriaId = @MateriaId;
END;

--------Procedures para Consulta de Notas

CREATE PROCEDURE ConsultaNotasAluno
  @AlunoId INT
AS
BEGIN
  SELECT a.Nome AS NomeAluno, c.Nome AS NomeCurso, m.Nome AS NomeMateria, 
         n.Unidade1, n.Unidade2, n.Unidade3, n.Unidade4, n.MediaFinal, n.Situacao
  FROM Notas n
  INNER JOIN Aluno a ON n.AlunoId = a.Id
  INNER JOIN Materia m ON n.MateriaId = m.Id
  INNER JOIN Curso c ON a.CursoId = c.Id
  WHERE a.Id = @AlunoId;
END;

-------------Procedures para Verificar Pendências

CREATE PROCEDURE VerificaPendenciasAprovacao
  @AlunoId INT,
  @MateriaId INT
AS
BEGIN
  DECLARE @PontosNecessarios FLOAT = 7 * 4;  -- Média mínima multiplicada pelo número de unidades
  DECLARE @PontosAtuais FLOAT;

  -- Soma os pntos atuais
  SELECT @PontosAtuais = ISNULL(Unidade1, 0) + ISNULL(Unidade2, 0) + ISNULL(Unidade3, 0) + ISNULL(Unidade4, 0)
  FROM Notas
  WHERE AlunoId = @AlunoId AND MateriaId = @MateriaId;

  -- Exibe quantos pontos faltam para o aluno ser aprovado
  SELECT @PontosNecessarios - @PontosAtuais AS PontosFaltantes;
END;

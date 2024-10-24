
CREATE TABLE Usuario (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Email NVARCHAR(100) UNIQUE,
    Login NVARCHAR(50) UNIQUE,
    Senha NVARCHAR(255),  -- Armazenar senhas de forma segura (hash)
    Tipo NVARCHAR(20) CHECK (Tipo IN ('Aluno', 'Professor', 'Administrador'))
);

CREATE TABLE Curso (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100)
);

CREATE TABLE Aluno (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100),
    CursoID INT,
    UsuarioID INT,
    FOREIGN KEY (CursoID) REFERENCES Curso(ID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID)
);

CREATE TABLE AlunoCurso (
    AlunoId INT,
    CursoId INT,
    PRIMARY KEY (AlunoId, CursoId),
    FOREIGN KEY (AlunoId) REFERENCES Aluno(Id),
    FOREIGN KEY (CursoId) REFERENCES Curso(Id)
);

CREATE TABLE Materia (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100)
);

CREATE TABLE Professor (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100),
    MateriaID INT,
    UsuarioID INT,
    FOREIGN KEY (MateriaID) REFERENCES Materia(ID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(ID)
);

CREATE TABLE ProfessorCurso (
    ProfessorId INT,
    CursoId INT,
    PRIMARY KEY (ProfessorId, CursoId),
    FOREIGN KEY (ProfessorId) REFERENCES Professor(Id),
    FOREIGN KEY (CursoId) REFERENCES Curso(Id)
);

CREATE TABLE CursoMateria (
    ID INT PRIMARY KEY IDENTITY(1,1),
    CursoID INT,
    MateriaID INT,
    FOREIGN KEY (CursoID) REFERENCES Curso(ID),
    FOREIGN KEY (MateriaID) REFERENCES Materia(ID),
    UNIQUE (CursoID, MateriaID)  -- Garante que não haja duplicatas
);

CREATE TABLE Notas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    AlunoId INT,
    MateriaId INT,
    Unidade1 FLOAT,
    Unidade2 FLOAT,
    Unidade3 FLOAT,
    Unidade4 FLOAT,
    MediaFinal FLOAT,
    Situacao NVARCHAR(20),
    FOREIGN KEY (AlunoId) REFERENCES Aluno(Id),
    FOREIGN KEY (MateriaId) REFERENCES Materia(Id)
);

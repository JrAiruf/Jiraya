namespace AppDomain.AppExceptions.Modules.UserModule
{
    public class UserException : AppException
    {
        public UserException(string message) : base(message)
        {
            Message = message;
        }

        public string Message { get; set; }
    }

    public class UserExceptionMessage
    {
        static public readonly string EmptyCode = "O código informado não pode ser nulo ou vazio.";
        static public readonly string WrongCode = "O código informado deve possuir pelo menos 8 caracteres.";
        static public readonly string EmptyPhone = "O telefone informado não pode ser nulo ou vazio.";
        static public readonly string WrongPhone = "O telefone informado deve possuir pelo menos 11 caracteres.";
    }
}

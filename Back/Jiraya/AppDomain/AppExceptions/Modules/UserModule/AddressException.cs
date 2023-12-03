namespace AppDomain.AppExceptions.Modules.UserModule
{
    public class AddressException : AppException
    {
        public AddressException(string message) : base(message)
        {
            Message = message;
        }

        public string Message { get; set; }
    }

    public class AddressExceptionMessage
    {
        public static readonly string EmptyStreetName = "O nome da rua não pode ser vazio ou nulo.";
        public static readonly string WrongStreetName = "O nome da rua não está em um formato válido.";
        public static readonly string EmptyNeighborhood = "O nome do bairro não pode ser vazio ou nulo.";
        public static readonly string WrongNeighborhood = "O nome do bairro não está em um formato válido.";
        public static readonly string EmptyNumber = "O número informado não pode ser vazio ou nulo.";
        public static readonly string WrongNumber = "O número informado não está em um formato válido .";
        public static readonly string EmptyCity = "O nome da cidade não pode ser vazio ou nulo.";
        public static readonly string WrongCity = "O nome da cidade não está em um formato válido.";
        public static readonly string EmptyState = "O nome do estado informado não pode ser vazio ou nulo.";
        public static readonly string WrongState = "O nome do estado informado não está em um formato válido.";
        public static readonly string EmptyZipCode = "O CEP informado não pode ser vazio ou nulo.";
        public static readonly string WrongZipCode = "O CEP informado deve conter 8 caracteres.";
        public static readonly string WrongLatitude = "Formato inválido de Latitude.";
        public static readonly string WrongLongitude = "Formato inválido de Longitude.";
        public static readonly string WrongAddress = "O endereço informado não é válido.";


    }
}

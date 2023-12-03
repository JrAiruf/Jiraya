
namespace AppDomain.AppExceptions
{
    public abstract class AppException : Exception
    {
        public AppException(string message) : base(message) 
        {
            Message = message;
        }
        public string Message { get; private set; }
    }
}

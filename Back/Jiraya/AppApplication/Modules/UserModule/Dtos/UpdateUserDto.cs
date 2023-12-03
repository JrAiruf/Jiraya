namespace AppApplication.Modules.UserModule.Dtos
{
    public class UpdateUserDto
    {
        public UpdateUserDto(Guid id, string name, string code)
        {
            Id = id;
            Name = name;
            Code = code;
        }
        public Guid Id { get; private set; }
        public string Name { get; private set; }
        public string Code { get; private set; }
    }
}

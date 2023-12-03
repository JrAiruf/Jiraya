using AppDomain.Validators.General;

namespace AppDomain.Modules
{
    public abstract class BaseEntity
    {
        private readonly GeneralValidator _validator = new GeneralValidator();
        public Guid Id { get; set; }
        public string? Name { get; private set; }

        public void ChangeName(string name)
        {
            _validator.Validate(name);
            Name = name;
        }
    }

}

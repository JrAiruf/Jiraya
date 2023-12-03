using AppDomain.AppExceptions.Modules;
using AppDomain.Validators;

namespace AppDomain.Validators.General
{
    public class GeneralValidator
    {
        private readonly NameContentValidator _nameContentValidator = new NameContentValidator();
        public void Validate(string name) => _nameContentValidator.Validate(name);
    }

    public class NameContentValidator : BaseValidator
    {
        public override bool? Validate(string? input)
        {
            if (!string.IsNullOrEmpty(input))
            {
                return NextValidator?.Validate(input) ?? true;
            }
            throw new BaseException(BaseExceptionMessage.EmptyName);
        }
    }

}

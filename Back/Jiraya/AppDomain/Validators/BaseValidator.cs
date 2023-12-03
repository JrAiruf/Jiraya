namespace AppDomain.Validators
{
    public abstract class BaseValidator
    {
        virtual public bool? Validate(string? input) => true;
        virtual public bool? Validate(int? input) => true;
        virtual public bool? Validate(decimal? input) => true;
        internal BaseValidator? NextValidator { get; set; }

    }
}

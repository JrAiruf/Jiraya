using AppInfra.Contracts;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class DeleteProductOrder
    {
        private readonly IProductRepository _repository;
        public DeleteProductOrder(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(Guid id)
        {
            await _repository.DeleteProductOrderAsync(id);
        }
    }
}

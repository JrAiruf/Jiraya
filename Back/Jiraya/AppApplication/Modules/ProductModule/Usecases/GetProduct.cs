using AppDomain.Modules.ProductsModule.Entities;
using AppInfra.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppApplication.Modules.ProductModule.Usecases
{
    public class GetProduct
    {
        private readonly IProductRepository _repository;
        public GetProduct(IProductRepository repository)
        {
            _repository = repository;
        }

        public async Task<Product> Handle(Guid id)
        {
            var product = await _repository.GetProductAsync(id);
            return product;
        }
    }
}

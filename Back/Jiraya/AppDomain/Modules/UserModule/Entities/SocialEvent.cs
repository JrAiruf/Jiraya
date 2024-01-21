using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppDomain.Modules.UserModule.Entities
{
    public class SocialEvent : BaseEntity
    {

        public string Title { get; private set; }
        public string Description { get; private set; }
        public DateTime EventDate { get; private set; }
        public SocialEvent() { }
    }
}

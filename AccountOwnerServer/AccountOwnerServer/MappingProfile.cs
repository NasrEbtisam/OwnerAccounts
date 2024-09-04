using AutoMapper;
using Entities.DTO;
using Entities.Models;

namespace AccountOwnerServer
{
    public class MappingProfile: Profile
    {
        public MappingProfile()
        {
            CreateMap<Owner, OwnerDTO>();
            CreateMap<Account, AccountDTO>();
            CreateMap<OwnerForCreationDto, Owner>();
            CreateMap<OwnerForUpdateDto, Owner>();
        }
    }
}

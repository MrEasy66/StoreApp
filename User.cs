//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ToysStoreApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class User
    {
        public int ID { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public int TypeId { get; set; }
        public Nullable<int> LastEnterId { get; set; }
    
        public virtual HistoryOfEnter HistoryOfEnter { get; set; }
        public virtual TypeOfUser TypeOfUser { get; set; }
    }
}
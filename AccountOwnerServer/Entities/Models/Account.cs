using System;
using System.Collections.Generic;

namespace Entities.Models;

public partial class Account
{
    public int Id { get; set; }

    public DateTime DateCreated { get; set; }

    public string AccountType { get; set; } = null!;

    public int OwnerId { get; set; }

    public virtual Owner Owner { get; set; } = null!;
}

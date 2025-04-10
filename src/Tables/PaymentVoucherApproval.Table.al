Table 52193525 "Payment Voucher Approval"
{

    fields
    {
        field(1;"User ID";Code[20])
        {
            NotBlank = true;
            TableRelation = User."User Security ID";
        }
        field(2;Status;Option)
        {
            OptionCaption = 'Pending,Verified,Approved,Canceled,Post';
            OptionMembers = Pending,Verified,Approved,Canceled,Post;
        }
    }

    keys
    {
        key(Key1;"User ID",Status)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}


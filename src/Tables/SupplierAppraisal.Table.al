Table 52193967 "Supplier Appraisal"
{

    fields
    {
        field(1;"Supplier Name";Text[60])
        {
            TableRelation = "Prequalified Suppliers1".Name;

            trigger OnValidate()
            begin
                   PrequalifiedSuppliers.Reset;
                   PrequalifiedSuppliers.SetRange(PrequalifiedSuppliers.Name,"Supplier Name");
                   if PrequalifiedSuppliers.Find('-') then
                     "Supplier Category":=PrequalifiedSuppliers.Category;
            end;
        }
        field(2;"Supplier Category";Code[10])
        {
        }
        field(3;"Delivery/Lead Time";Option)
        {
            OptionCaption = '  ,Timely,Early,Late,Too Late';
            OptionMembers = "  ",Timely,Early,Late,"Too Late";
        }
        field(4;"Location of Delivery";Text[30])
        {
        }
        field(5;"Rejected Items";Option)
        {
            OptionCaption = ' ,None,A few,Most,All';
            OptionMembers = " ","None","A few",Most,All;
        }
        field(6;"Product Quality";Option)
        {
            OptionCaption = ' ,Poor,Fair,Good,Very Good';
            OptionMembers = " ",Poor,Fair,Good,"Very Good";
        }
        field(7;"Product Pricing";Option)
        {
            OptionCaption = ' ,Too Cheap,Reasonable,Expensive';
            OptionMembers = " ","Too Cheap",Reasonable,Expensive;
        }
    }

    keys
    {
        key(Key1;"Supplier Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PrequalifiedSuppliers: Record "Prequalified Suppliers1";
}


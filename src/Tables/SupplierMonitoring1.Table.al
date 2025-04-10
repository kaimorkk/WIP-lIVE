Table 52193788 "Supplier Monitoring1"
{

    fields
    {
        field(1;"Purchase Order No.";Code[20])
        {
            TableRelation = "Purchase Header"."No." where ("Document Type"=const(Order));

            trigger OnValidate()
            begin
                  if PO.Get(PO."document type"::Order,"Purchase Order No.") then
                  begin
                    "Vendor Name":=PO."Pay-to Name";
                  end;
            end;
        }
        field(2;"Brief Description of Work done";Text[250])
        {
        }
        field(3;"Agreed Start Date";Date)
        {
        }
        field(4;"Actual Start Date";Date)
        {
        }
        field(5;"Agreed Completion date";Date)
        {
        }
        field(6;"Actual Completion Date";Date)
        {
        }
        field(7;"Completed Within Schedule";Boolean)
        {
        }
        field(8;"Reasons for Late completion";Text[250])
        {
        }
        field(9;"Quality of Work";Text[30])
        {
        }
        field(10;"User ID";Code[50])
        {
        }
        field(11;"Creation Date";Date)
        {
        }
        field(12;"Vendor Name";Text[250])
        {
        }
        field(13;Pricing;Option)
        {
            OptionCaption = ',Reasonable,Unreasonable';
            OptionMembers = ,Reasonable,Unreasonable;
        }
        field(14;"Provides Support";Boolean)
        {
        }
        field(15;"Quality of Support";Option)
        {
            OptionCaption = ',Poor,Satisfactory,Good,Excellent';
            OptionMembers = ,Poor,Satisfactory,Good,Excellent;
        }
    }

    keys
    {
        key(Key1;"Purchase Order No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PO: Record "Purchase Header";
}


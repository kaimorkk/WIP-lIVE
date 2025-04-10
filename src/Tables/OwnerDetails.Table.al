Table 52194064 "Owner Details"
{
    DrillDownPageID = "Owner Details List";
    LookupPageID = "Owner Details List";

    fields
    {
        field(1;"Supplier No.";Code[20])
        {
            TableRelation = Vendor;
        }
        field(2;"Line No";Integer)
        {
        }
        field(3;Name;Text[100])
        {
        }
        field(4;Address;Text[50])
        {
            Caption = 'Address';
        }
        field(5;"Address 2";Text[50])
        {
            Caption = 'Address 2';
        }
        field(6;City;Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code"=const('')) "Post Code".City
                            else if ("Country/Region Code"=filter(<>'')) "Post Code".City where ("Country/Region Code"=field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(7;"Phone No.";Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(8;"Post Code";Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code"=const('')) "Post Code"
                            else if ("Country/Region Code"=filter(<>'')) "Post Code" where ("Country/Region Code"=field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(9;County;Text[30])
        {
            Caption = 'County';
        }
        field(10;"Email Address";Text[50])
        {
            ExtendedDatatype = EMail;
        }
        field(11;"Percentage Ownership";Decimal)
        {
        }
        field(12;"Country/Region Code";Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                if ("Country/Region Code" <> xRec."Country/Region Code") and (xRec."Country/Region Code" <> '') then;
            end;
        }
    }

    keys
    {
        key(Key1;"Supplier No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PostCode: Record "Post Code";
}


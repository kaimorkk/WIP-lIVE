Table 52193505 "Next of Kin FOSA"
{

    fields
    {
        field(2;Name;Text[50])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                Name:=UpperCase(Name);
            end;
        }
        field(3;Relationship;Text[30])
        {
            TableRelation = "Relationship Types".Description;
        }
        field(4;Beneficiary;Boolean)
        {
        }
        field(5;"Date of Birth";Date)
        {
        }
        field(6;Address;Text[30])
        {
        }
        field(7;Telephone;Code[20])
        {
        }
        field(8;Fax;Code[20])
        {
        }
        field(9;Email;Text[30])
        {
        }
        field(10;"Account No";Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(11;"ID No.";Code[20])
        {
        }
        field(12;"%Allocation";Decimal)
        {
        }
        field(14;City;Text[30])
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
        field(15;"Country/Region Code";Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(16;Picture;Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(17;"Post Code";Code[20])
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
        field(18;County;Text[30])
        {
            Caption = 'County';
        }
        field(19;Date;Date)
        {
        }
        field(20;Status;Option)
        {
            OptionCaption = ' ,Active,Inactive';
            OptionMembers = " ",Active,Inactive;
        }
        field(21;"Benefit Collected";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Account No",Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Date:=Today;
    end;

    var
        PostCode: Record "Post Code";
}


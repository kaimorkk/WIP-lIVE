Table 52193450 Branches
{
    DrillDownPageID = "Branches List";
    LookupPageID = "Branches List";

    fields
    {
        field(1;"Branch Code";Code[50])
        {
            NotBlank = true;
        }
        field(2;"Branch Name";Text[100])
        {
            NotBlank = true;
        }
        field(3;"Physical Address";Text[50])
        {
            Caption = 'Address';
        }
        field(5;Address;Text[50])
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
        field(7;Contact;Text[50])
        {
            Caption = 'Contact';
        }
        field(8;"Phone No.";Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(9;"Country/Region Code";Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }
        field(10;Picture;Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(11;"Post Code";Code[20])
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
        field(12;"E-Mail";Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
        }
        field(13;"Home Page";Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(14;Blocked;Option)
        {
            Caption = 'Blocked';
            OptionCaption = ' ,Ship,Invoice,All';
            OptionMembers = " ",Ship,Invoice,All;
        }
        field(15;County;Text[30])
        {
            Caption = 'County';
        }
    }

    keys
    {
        key(Key1;"Branch Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Branch Code","Branch Name",City)
        {
        }
    }

    var
        PostCode: Record "Post Code";
}


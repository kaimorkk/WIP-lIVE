Table 52193706 Trustees1
{
    //DrillDownPageID = UnknownPage51013;
    //LookupPageID = UnknownPage51013;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; SurName; Text[100])
        {
        }
        field(3; "Other Names"; Text[150])
        {
        }
        field(4; Remarks; Text[200])
        {
        }
        field(5; "Cell phone number"; Text[100])
        {
        }
        field(6; "Postal Address"; Text[100])
        {
        }
        field(7; "Other Phone Number"; Text[100])
        {
        }
        field(8; "Email Address"; Text[100])
        {
        }
        field(9; City; Text[30])
        {
            Caption = 'City';

            trigger OnLookup()
            begin
                //PostCode.LookUpCity(City,"Post Code",TRUE);
            end;

            trigger OnValidate()
            begin
                //PostCode.ValidateCity(City,"Post Code");
            end;
        }
        field(29; Picture; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(35; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                Countr.Get("Country/Region Code");
                Country := Countr.Name;
                Modify;
            end;
        }
        field(91; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                //PostCode.LookUpPostCode(City,"Post Code",TRUE);
            end;

            trigger OnValidate()
            begin
                //PostCode.ValidatePostCode(City,"Post Code");
            end;
        }
        field(92; "Physical Address"; Text[80])
        {
        }
        field(93; Country; Text[50])
        {
        }
        field(94; "Date Of Birth"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PostCode: Record "Post Code";
        Countr: Record "Country/Region";
}


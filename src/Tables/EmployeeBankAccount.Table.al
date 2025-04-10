Table 52193536 "Employee Bank Account"
{
    // //DrillDownPageID = UnknownPage51507377;
    // //LookupPageID = UnknownPage51507377;

    fields
    {
        field(1; "Employee No."; Code[20])
        {
            NotBlank = true;
            //TableRelation = "Loans transactions".Code;
        }
        field(2; "Code"; Code[10])
        {
            NotBlank = true;
        }
        field(3; Name; Text[30])
        {
        }
        field(5; "Name 2"; Text[30])
        {
        }
        field(6; Address; Text[30])
        {
        }
        field(7; "Address 2"; Text[30])
        {
        }
        field(8; City; Text[30])
        {
        }
        field(9; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if PostCode.Get("Post Code") then
                    City := PostCode.City;
            end;
        }
        field(10; Contact; Text[30])
        {
        }
        field(11; "Phone No."; Text[30])
        {
        }
        field(12; "Telex No."; Text[20])
        {
        }
        field(13; "Bank Branch No."; Text[20])
        {
            NotBlank = true;
        }
        field(14; "Bank Account No."; Text[30])
        {
        }
        field(15; "Transit No."; Text[20])
        {
        }
        field(16; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
        }
        field(17; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(18; County; Text[30])
        {
        }
        field(19; "Fax No."; Text[30])
        {
        }
        field(20; "Telex Answer Back"; Text[20])
        {
        }
        field(21; "Language Code"; Code[10])
        {
            TableRelation = Language;
        }
        field(22; "E-Mail"; Text[80])
        {
        }
        field(23; "Home Page"; Text[80])
        {
        }
        field(24; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Period";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Bank Branch No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        PostCode: Record "Post Code";
}


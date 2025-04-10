Table 52193629 Departments
{
    DrillDownPageID = "Departments List";
    LookupPageID = "Departments List";

    fields
    {
        field(1; "No."; Code[50])
        {
        }
        field(2; Description; Text[200])
        {
        }
        field(3; Name; Text[50])
        {
            Caption = 'Name';

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(4; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
        }
        field(5; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(6; City; Text[30])
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
        field(7; Contact; Text[50])
        {
            Caption = 'Contact';

            trigger OnValidate()
            begin
                /*IF RMSetup.GET THEN
                  IF RMSetup."Bus. Rel. Code for Customers" <> '' THEN
                    IF (xRec.Contact = '') AND (xRec."Primary Contact No." = '') THEN BEGIN
                      MODIFY;
                      UpdateContFromCust.OnModify(Rec);
                      UpdateContFromCust.InsertNewContactPerson(Rec,FALSE);
                      MODIFY(TRUE);
                    END*/

            end;
        }
        field(8; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(9; Blocked; Option)
        {
            Caption = 'Blocked';
            OptionCaption = ' ,Ship,Invoice,All';
            OptionMembers = " ",Ship,Invoice,All;
        }
        field(10; "Post Code"; Code[20])
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
        field(11; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
        }
        field(12; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(13; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Released,Active,"Non-Active",Suspended,Deceased,Withdrawan,Retired,Termination,"Family Member",Rejected,,,BOSA;

            trigger OnValidate()
            begin
                //Advice:=TRUE;
            end;
        }
        field(14; "Employer Code"; Code[30])
        {
            TableRelation = "Bank Account";
        }
        field(15; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(16; "Creation Date"; Date)
        {
        }
        field(17; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "No.", "Employer Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Dropdown; "No.", Description, Name)
        {
        }
    }

    trigger OnInsert()
    begin
        /* IF "No."='' THEN BEGIN
           BosaSetup.GET();
           BosaSetup.TESTFIELD(BosaSetup."Department Nos");
           NoSeriesMgt.InitSeries(BosaSetup."Department Nos",xRec."No. Series",0D,"No.","No. Series");
         END; */

    end;

    var
        PostCode: Record "Post Code";
        BosaSetup: Record "Bosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RMSetup: Record "Marketing Setup";
}


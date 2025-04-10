
table 69514 "Case Plantiff-Defandants"
{

    fields
    {
        field(1; "Case No"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Register"."No.";
        }
        field(2; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Plaintiff,Defendant';
            OptionMembers = " ",Plaintiff,Defendant;
        }
        field(3; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                CasePlantiffsAll: Record "Case Plantiffs All";
            begin
                Plantiff.Reset;
                Plantiff.SetRange(No, Code);
                if Plantiff.Find('-') then begin
                    "First Name" := Plantiff."First Name";
                    "Second Name" := Plantiff."Second Name";
                    "Last Name" := Plantiff."Last name";
                    Email := Plantiff.Email;
                    Address := Plantiff.Address;
                    Names := (Plantiff."First Name" + '' + Plantiff."Second Name" + '' + Plantiff."Last name");
                    Contacts := Plantiff.Contacts;

                end;
                CasePlantiffsAll.Reset;
                CasePlantiffsAll.SetRange(No, Code);
                if CasePlantiffsAll.FindSet then begin
                    "First Name" := CasePlantiffsAll."First Name";
                    "Second Name" := CasePlantiffsAll."Second Name";
                    "Last Name" := CasePlantiffsAll."Last Name";
                    //Names:=(CasePlantiffsAll."First Name"+''+CasePlantiffsAll."Second Name"+''+CasePlantiffsAll."Last Name");
                    Validate(Names);
                    Contacts := CasePlantiffsAll.Contacts;
                    "Source Firm" := CasePlantiffsAll."Source Contact Code";
                    Address := CasePlantiffsAll.Address;
                    Email := CasePlantiffsAll.Email;
                end;
            end;
        }
        field(4; Names; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const(Plaintiff)) "Case Plantiffs All".Names
            else
            if (Type = const(Defendant)) "Case Defendants All".Names;
        }
        field(5; Contacts; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7; "Source Firm"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact."No." where("Company No." = field(Code));
        }
        field(8; Address; Text[40])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "First Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Second Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Last Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Case No", Type, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Plantiff: Record "Case Defendants All";
}


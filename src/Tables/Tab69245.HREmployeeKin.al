
table 69245 "HR Employee Kin"
{
    Caption = 'Employee Relative';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            NotBlank = true;
            Editable = false;
            TableRelation = Employee."No.";
        }
        field(2; Relationship; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Lookup Values".Code where(Type = const("Next of Kin"));
        }

        field(3; SurName; Text[50])
        {
            NotBlank = true;
        }
        field(4; "Other Names"; Text[100])
        {
            NotBlank = true;
        }
        field(5; "ID No/Passport No"; Text[50])
        {
        }
        field(6; "Date Of Birth"; Date)
        {
        }
        field(7; Occupation; Text[100])
        {
        }
        field(8; Address; Text[250])
        {
        }
        field(9; "Office Tel No"; Text[100])
        {
        }
        field(10; "Home Tel No"; Text[50])
        {
        }
        field(12; Type; Option)
        {
            OptionCaption = 'Next of Kin,Beneficiary,Dependant,Spouse,Siblings,In-Laws';
            OptionMembers = "Next of Kin",Beneficiary,Dependant,Spouse,Siblings,"In-Laws";
        }
        field(13; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(14; Comment; Boolean)
        {
            CalcFormula = exist("Human Resource Comment Line" where("Table Name" = const("Employee Relative"),
                                                                     "No." = field("Employee Code"),
                                                                     "Table Line No." = field("Line No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50000; "E-mail"; Text[60])
        {
        }
        field(50001; "Code"; Code[20])
        {
        }
        field(50002; Age; Integer)
        {
        }
        field(50003; PWD; Boolean)
        {
        }
        field(50004; "Card No"; Code[20])
        {
            trigger OnValidate()
            begin
                if "Identification Type" = "Identification Type"::" " then Error('Select Identification Type');
            end;
        }
        field(17; "No."; Code[20])
        {
        }
        field(18; "Member ID"; Text[50])
        {

        }
        field(19; Category; Text[30])
        {
        }
        field(20; Gender; Option)
        {

            OptionMembers = " ","Male","Female";
        }
        field(21; Status; Option)
        {
            OptionMembers = " ",Active,Inactive;
            Editable = false;
        }
        field(25; "Identification Type"; Option)
        {
            OptionMembers = " ","Passport No.","ID Number","Birth Cert. No.";
        }
        field(26; "Number In the Family"; Text[40])
        {

        }

        field(27; "% Share of Benefits"; Integer)
        {
            trigger OnValidate()
            begin
                if ("% Share of Benefits" < 0) or ("% Share of Benefits" > 100) then begin
                    Error('"% Share of Benefits" must be between 0 and 100.');
                end;
            end;
        }

        field(28; "email address"; Text[50])
        {

        }

        field(29; "doctor name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(30; "doctor Number"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

        field(31; "doctor Address"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Percentage Shares"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; Name; Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Employee Code", Type, Relationship, SurName, "Other Names", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        HRCommentLine: Record "Human Resource Comment Line";
    begin
        HRCommentLine.SetRange("Table Name", HRCommentLine."table name"::"Employee Relative");
        HRCommentLine.SetRange("No.", "Employee Code");
        HRCommentLine.DeleteAll;
    end;

    trigger OnInsert()
    begin
        i := 0;
        HRKin.Reset;
        HRKin.SetRange(HRKin."Employee Code", Rec."Employee Code");
        HRKin.SetRange(HRKin.Relationship, Rec.Relationship);
        if HRKin.Find('-') then begin
            repeat
                i := i + 1;
                if (Rec.Relationship = 'SPOUSE') and (i > 0) then
                    Error('There can only be 1 Spouce for every Employee');
            //    IF (Rec.Relationship = 'CHILD') AND (i > 3 ) THEN
            //      ERROR('There can only be a Maximum of 4 Children for every Employee');
            until HRKin.Next = 0;
        end;
    end;

    trigger OnRename()
    begin
        i := 0;
        HRKin.Reset;
        HRKin.SetRange(HRKin."Employee Code", Rec."Employee Code");
        HRKin.SetRange(HRKin.Relationship, Rec.Relationship);
        if HRKin.Find('-') then begin
            repeat
                i := i + 1;
                if (Rec.Relationship = 'SPOUSE') and (i > 0) then
                    Error('There can only be 1 Spouce for every Employee');
            //    IF (Rec.Relationship = 'CHILD') AND (i > 3 ) THEN
            //      ERROR('There can only be a Maximum of 4 Children for every Employee');
            until HRKin.Next = 0;
        end;
    end;

    var
        i: Integer;
        HRKin: Record "HR Employee Kin";
}


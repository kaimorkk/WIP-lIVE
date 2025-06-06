
table 69236 "HR Applicant Qualifications"
{
    Caption = 'HR Applicant Qualifications';
    DataCaptionFields = "Employee No.";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No"; Code[10])
        {
            Caption = 'Application No';
            TableRelation = "HR Job Applications"."Application No";
        }
        field(2; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            NotBlank = true;
        }
        field(3; "Qualification Description"; Code[80])
        {
            Caption = 'Qualification Description';
            NotBlank = true;

            trigger OnValidate()
            begin
                /*
                Qualifications.RESET;
                Qualifications.SETRANGE(Qualifications.Code,"Qualification Description");
                IF Qualifications.FIND('-') THEN
                "Qualification Code":=Qualifications.Description;
                */

            end;
        }
        field(4; "From Date"; Date)
        {
            Caption = 'From Date';
        }
        field(5; "To Date"; Date)
        {
            Caption = 'To Date';
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Internal,External,Previous Position';
            OptionMembers = " ",Internal,External,"Previous Position";
        }
        field(7; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(8; "Institution/Company"; Text[30])
        {
            Caption = 'Institution/Company';
        }
        field(9; Cost; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost';
        }
        field(10; "Course Grade"; Text[30])
        {
            Caption = 'Course Grade';
        }
        field(11; "Employee Status"; Option)
        {
            Caption = 'Employee Status';
            Editable = false;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(13; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(14; "Qualification Type"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter("Qualification Type"));
        }
        field(15; "Qualification Code"; Text[200])
        {
            TableRelation = "HR Job Qualifications".Code where("Qualification Type" = field("Qualification Type"));

            trigger OnValidate()
            begin
                if HRQualifications.Get("Qualification Type", "Qualification Code") then
                    "Qualification Description" := HRQualifications.Description;
            end;
        }
        field(16; "Score ID"; Decimal)
        {
        }
        field(17; "Code"; Integer)
        {
            AutoIncrement = true;
        }
        field(18; "Date of Renewal"; Date)
        {
        }
        field(19; "Membership Registration No"; Text[50])
        {
        }
        field(20; Specialization; Text[100])
        {
        }
        field(21; "Job ID"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Application No", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HRQualifications: Record "HR Job Qualifications";
        Applicant: Record "HR Job Applications";
        Position: Code[20];
        JobReq: Record "HR Job Requirements";
}


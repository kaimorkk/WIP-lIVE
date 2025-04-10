Table 52193775 "Applicants Qualification1"
{
    Caption = 'Applicants Qualification';
    DataCaptionFields = "Applicant No.";
    DrillDownPageID = "Applicants Qualification1";
    LookupPageID = "Applicants Qualification1";

    fields
    {
        field(1;"Applicant No.";Code[20])
        {
            Caption = 'Employee No.';
            NotBlank = true;
            TableRelation = Applicants1."No.";
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(3;"Qualification Code";Code[20])
        {
            Caption = 'Qualification Code';
            NotBlank = true;
            TableRelation = Qualification.Code where ("Qualification Type"=field("Qualification Type"));

            trigger OnValidate()
            begin
                Qualifications.Reset;
                Qualifications.SetRange(Qualifications.Code,"Qualification Code");
                if Qualifications.Find('-') then
                Qualification:=Qualifications.Description;
            end;
        }
        field(4;"From Date";Date)
        {
            Caption = 'From Date';
        }
        field(5;"To Date";Date)
        {
            Caption = 'To Date';
        }
        field(6;Type;Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Internal,External,Previous Position';
            OptionMembers = " ",Internal,External,"Previous Position";
        }
        field(7;Description;Text[30])
        {
            Caption = 'Description';
        }
        field(8;"Institution/Company";Text[30])
        {
            Caption = 'Institution/Company';
        }
        field(9;Cost;Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost';
        }
        field(10;"Course Grade";Text[30])
        {
            Caption = 'Course Grade';
        }
        field(11;"Employee Status";Option)
        {
            Caption = 'Employee Status';
            Editable = false;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(12;Comment;Boolean)
        {
            CalcFormula = exist("Human Resource Comment Line" where ("Table Name"=const("Employee Qualification"),
                                                                     "No."=field("Applicant No."),
                                                                     "Table Line No."=field("Line No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13;"Expiration Date";Date)
        {
            Caption = 'Expiration Date';
        }
        field(50000;"Qualification Type";Option)
        {
            NotBlank = false;
            OptionMembers = " ",Academic,Professional,Technical;
        }
        field(50001;Qualification;Text[200])
        {
            NotBlank = true;
        }
        field(50003;"Score ID";Decimal)
        {
            TableRelation = "Score Setup1"."Score ID";
        }
    }

    keys
    {
        key(Key1;"Applicant No.","Qualification Type","Qualification Code")
        {
            Clustered = true;
            SumIndexFields = "Score ID";
        }
        key(Key2;"Qualification Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Qualifications: Record Qualification;
        Applicant: Record Applicants1;
        Position: Code[20];
        JobReq: Record "Job Requirement1";
}


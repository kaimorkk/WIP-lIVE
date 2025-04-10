
table 80222 "Business Research Response"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {

            trigger OnValidate()
            begin
                if "Document No." <> xRec."Document No." then begin
                    BRInnovationSetup.Get;
                    NoSeriesMgt.TestManual(BRInnovationSetup."Survey Response No. Series");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Business Research Category"; Option)
        {
            OptionCaption = 'Employee Experience,Customer Experience,Post-Project Survey,Custom Survey';
            OptionMembers = "Employee Experience","Customer Experience","Post-Project Survey","Custom Survey";
        }
        field(3; "Document Date"; Date)
        {
        }
        field(4; "Survey ID"; Code[30])
        {
            TableRelation = "Business Research Survey"."Document No.";
        }
        field(5; "Survey Type"; Code[30])
        {
            TableRelation = "Research Survey Type".Code;
        }
        field(6; "Target Respondent Type"; Option)
        {
            OptionCaption = 'Employees,Stakeholders,Contacts,Suppliers';
            OptionMembers = Employees,Customers,Contacts,Vendors;
        }
        field(7; "Participant ID"; Code[50])
        {
        }
        field(8; Name; Code[255])
        {
        }
        field(9; Description; Text[255])
        {
        }
        field(10; "Project ID"; Code[30])
        {
            TableRelation = Job."No.";
        }
        field(11; "Primary Department ID"; Code[30])
        {
        }
        field(12; "Primary Directorate ID"; Code[30])
        {
        }
        field(13; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; "Due Date"; Date)
        {
        }
        field(15; Status; Option)
        {
            OptionCaption = 'Open,Submitted';
            OptionMembers = Open,Submitted;
        }
        field(16; "Submitted Date"; Date)
        {
        }
        field(17; "ID Number"; Code[10])
        {
        }
        field(18; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(19; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            BRInnovationSetup.Get;
            BRInnovationSetup.TestField("Survey Response No. Series");
            NoSeriesMgt.InitSeries(BRInnovationSetup."Survey Response No. Series", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
    end;

    var
        BRInnovationSetup: Record "e-BR & Innovation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        ResearchSurveyType: Record "Research Survey Type";
        BusinessResearchTemplate: Record "Business Research Template";
        ResponsibilityCenter: Record "Responsibility Center";
}


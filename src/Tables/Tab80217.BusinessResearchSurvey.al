
table 80217 "Business Research Survey"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {

            trigger OnValidate()
            begin
                if "Business Research Category" = "business research category"::"Employee Experience" then begin
                    if "Document No." <> xRec."Document No." then begin
                        BRInnovationSetup.Get;
                        NoSeriesMgt.TestManual(BRInnovationSetup."Employee Survey No. Series");
                        "No. Series" := '';
                    end;
                end;

                if "Business Research Category" = "business research category"::"Customer Experience" then begin
                    if "Document No." <> xRec."Document No." then begin
                        BRInnovationSetup.Get;
                        NoSeriesMgt.TestManual(BRInnovationSetup."Customer Survey No. Series");
                        "No. Series" := '';
                    end;
                end;

                if "Business Research Category" = "business research category"::"Post-Project Survey" then begin
                    if "Document No." <> xRec."Document No." then begin
                        BRInnovationSetup.Get;
                        NoSeriesMgt.TestManual(BRInnovationSetup."Post-Project Survey No. Series");
                        "No. Series" := '';
                    end;
                end;

                if "Business Research Category" = "business research category"::"Custom Survey" then begin
                    if "Document No." <> xRec."Document No." then begin
                        BRInnovationSetup.Get;
                        NoSeriesMgt.TestManual(BRInnovationSetup."Custom Surveys No. Series");
                        "No. Series" := '';
                    end;
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
        field(4; "Survey Type"; Code[30])
        {
            TableRelation = "Research Survey Type".Code;

            trigger OnValidate()
            begin
                if ResearchSurveyType.Get("Survey Type") then begin
                    "Business Research Category" := ResearchSurveyType."Business Research Category";
                    Description := ResearchSurveyType.Description;
                    "Target Respondent Type" := ResearchSurveyType."Target Respondent Type";
                    "Primary Department ID" := ResearchSurveyType."Primary Department";
                    "Primary Directorate ID" := ResearchSurveyType."Primary Directorate";
                end;
            end;
        }
        field(5; Description; Text[50])
        {
        }
        field(6; "Business Research Template ID"; Code[30])
        {
            TableRelation = "Business Research Template"."Template ID" where(Blocked = const(false));

            trigger OnValidate()
            begin
                if BusinessResearchTemplate.Get("Business Research Template ID") then begin
                    "Target Respondent Type" := BusinessResearchTemplate."Target Respondent Type";

                end;
            end;
        }
        field(7; "Target Respondent Type"; Option)
        {
            OptionCaption = 'Employees,Stakeholders,Contacts,Suppliers';
            OptionMembers = Employees,Customers,Contacts,Vendors;
        }
        field(8; "Project ID"; Code[30])
        {
            TableRelation = Job."No.";
        }
        field(9; "Primary Department ID"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Blocked?" = const(false));

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Directorate ID" := ResponsibilityCenter."Direct Reports To";
                end;
            end;
        }
        field(10; "Primary Directorate ID"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate),
                                                           "Blocked?" = const(false));
        }
        field(11; Published; Boolean)
        {
        }
        field(12; "Date Published"; Date)
        {
        }
        field(13; "Response Due Date"; Date)
        {
        }
        field(14; "Created By"; Code[30])
        {
        }
        field(15; "Creation Date"; Date)
        {
        }
        field(16; "Creation Time"; Time)
        {
        }
        field(17; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(18; "No. of Responses"; Integer)
        {
        }
        field(19; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(20; "Published By"; Code[50])
        {
        }
        field(21; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(22; "Last Date Modified"; Date)
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
        if "Business Research Category" = "business research category"::"Employee Experience" then begin
            if "Document No." = '' then begin
                BRInnovationSetup.Get;
                BRInnovationSetup.TestField("Employee Survey No. Series");
                NoSeriesMgt.InitSeries(BRInnovationSetup."Employee Survey No. Series", xRec."No. Series", 0D, "Document No.", "No. Series");
            end;
        end;

        if "Business Research Category" = "business research category"::"Customer Experience" then begin
            if "Document No." = '' then begin
                BRInnovationSetup.Get;
                BRInnovationSetup.TestField("Customer Survey No. Series");
                NoSeriesMgt.InitSeries(BRInnovationSetup."Customer Survey No. Series", xRec."No. Series", 0D, "Document No.", "No. Series");
            end;
        end;

        if "Business Research Category" = "business research category"::"Post-Project Survey" then begin
            if "Document No." = '' then begin
                BRInnovationSetup.Get;
                BRInnovationSetup.TestField("Post-Project Survey No. Series");
                NoSeriesMgt.InitSeries(BRInnovationSetup."Post-Project Survey No. Series", xRec."No. Series", 0D, "Document No.", "No. Series");
            end;
        end;

        if "Business Research Category" = "business research category"::"Custom Survey" then begin
            if "Document No." = '' then begin
                BRInnovationSetup.Get;
                BRInnovationSetup.TestField("Custom Surveys No. Series");
                NoSeriesMgt.InitSeries(BRInnovationSetup."Custom Surveys No. Series", xRec."No. Series", 0D, "Document No.", "No. Series");
            end;
        end;

        "Document Date" := Today;
        "Created By" := UserId;
        "Creation Date" := Today;
        "Creation Time" := Time;


    end;

    var
        BRInnovationSetup: Record "e-BR & Innovation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        ResearchSurveyType: Record "Research Survey Type";
        BusinessResearchTemplate: Record "Business Research Template";
        ResponsibilityCenter: Record "Responsibility Center";
}


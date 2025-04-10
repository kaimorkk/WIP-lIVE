Table 80253 "Innovation Evaluation"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Document No" <> xRec."Document No" then begin
                    InnovationSetup.Get;
                    NoSeriesMgt.TestManual(InnovationSetup."Inno Evaluation Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Invitation ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Solicitation"."Document No" where("Document Type" = const("Innovation Invitation"),
                                                                           Status = const(Released),
                                                                           Published = const(true));

            trigger OnValidate()
            begin
                InnovationSolicitation.Reset;
                InnovationSolicitation.SetRange("Invitation ID", "Invitation ID");
                if InnovationSolicitation.Find('-') then begin
                    "Innovation Category" := InnovationSolicitation."Innovation Category";
                    "Innovation Lead" := InnovationSolicitation."Innovation Lead";
                    Description := InnovationSolicitation."Executive Summary";
                    //"Idea Submission Start Date":=InnovationSolicitation."Idea Submission Start Date";
                    //"Idea Submission End Date":=InnovationSolicitation."Idea Submission End Date";
                    "Directorate ID" := InnovationSolicitation."Directorate ID";
                    "Department ID" := InnovationSolicitation."Department ID";
                    "Dimension Set ID" := InnovationSolicitation."Dimension Set ID";
                    //"Innovation Rating Template ID":=InnovationSolicitation."Innovation Rating Template ID";
                    "Region ID" := InnovationSolicitation."Region ID";
                end;
            end;
        }
        field(4; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Innovation Category"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Innovation Category";
        }
        field(6; "Innovation Lead"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where(Status = const(Active));
        }
        field(7; "Directorate ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Responsibility Center" where (Test=const(1));
        }
        field(8; "Department ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(9; "Region ID"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(11; Published; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(13; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Evaluation Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Draft,Completed,Cancelled';
            OptionMembers = Draft,Completed,Cancelled;
        }
        field(17; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            InnovationSetup.Get;
            InnovationSetup.TestField("Inno Evaluation Nos");
            NoSeriesMgt.InitSeries(InnovationSetup."Inno Evaluation Nos", xRec."No. Series", 0D, "Document No", "No. Series");
        end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        InnovationSetup: Record "Innovation Setup";
        InnovationSolicitation: Record "Innovation Solicitation";
}


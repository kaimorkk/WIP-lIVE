
table 80251 "Innovation Solicitation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Innovation Invitation,Idea Response';
            OptionMembers = "Innovation Invitation","Idea Response";
        }
        field(2; "Document No"; Code[30])
        {

            trigger OnValidate()
            begin
                if ("Document Type" = "document type"::"Innovation Invitation") then begin
                    InnovationSetup.Get;
                    NoSeriesMgt.TestManual(InnovationSetup."Idea Invitation Nos");
                    "No. Series" := '';
                end;

                if ("Document Type" = "document type"::"Idea Response") then begin
                    InnovationSetup.Get;
                    NoSeriesMgt.TestManual(InnovationSetup."Idea Capture Form Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(3; "Document Date"; Date)
        {
        }
        field(4; "Invitation ID"; Code[30])
        {
            TableRelation = "Innovation Solicitation"."Document No" where("Document Type" = const("Innovation Invitation"),
                                                                           Status = const(Released),
                                                                           Published = const(true));

            trigger OnValidate()
            begin
                // IF InnovationSolicitation.GET( InnovationSolicitation."Document Type", InnovationSolicitation."Invitation ID")    THEN BEGIN
                //  "Innovation Category":="Innovation Category";
                InnovationSolicitation.Reset;
                InnovationSolicitation.SetRange("Invitation ID", "Invitation ID");
                if InnovationSolicitation.Find('-') then begin
                    "Innovation Category" := InnovationSolicitation."Innovation Category";
                    "Innovation Lead" := InnovationSolicitation."Innovation Lead";
                    "Idea Submission Start Date" := InnovationSolicitation."Idea Submission Start Date";
                    "Idea Submission End Date" := InnovationSolicitation."Idea Submission End Date";
                    "Directorate ID" := InnovationSolicitation."Directorate ID";
                    "Department ID" := InnovationSolicitation."Department ID";
                    "Dimension Set ID" := InnovationSolicitation."Dimension Set ID";
                    "Innovation Rating Template ID" := InnovationSolicitation."Innovation Rating Template ID";
                    "Region ID" := InnovationSolicitation."Region ID";
                end;

            end;
        }
        field(5; "Idea Originator"; Code[30])
        {
            TableRelation = Employee."No." where(Status = const(Active));

            trigger OnValidate()
            begin
                if Employee.Get("Idea Originator") then begin
                    Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;
            end;
        }
        field(6; Name; Text[255])
        {
        }
        field(7; Description; Text[255])
        {
        }
        field(8; "Innovation Category"; Code[30])
        {
            TableRelation = "Innovation Category";
        }
        field(9; "Innovation Rating Template ID"; Code[30])
        {
            TableRelation = "Innovation Rating Template";
        }
        field(10; "Innovation Lead"; Code[30])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Employee.Get("Innovation Lead") then begin
                    "Lead Name" := Employee.FullName;
                end;
            end;
        }
        field(11; "Executive Summary"; Text[255])
        {
        }
        field(12; "Idea Submission Start Date"; Date)
        {
        }
        field(13; "Idea Submission End Date"; Date)
        {
        }
        field(14; "Directorate ID"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(15; "Department ID"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(16; "Region ID"; Code[50])
        {
            TableRelation = Location;
        }
        field(17; "No. of Innovation Ideas"; Integer)
        {
            CalcFormula = count("Innovation Solicitation" where("Document Type" = const("Idea Response"),
                                                                 "Invitation ID" = field("Document No")));
            FieldClass = FlowField;
        }
        field(18; "No. of Innov Comm Appointments"; Integer)
        {
        }
        field(19; "No. of Innov Evaluations"; Integer)
        {
            CalcFormula = count("Innovation Evaluation" where("Invitation ID" = field("Invitation ID")));
            FieldClass = FlowField;
        }
        field(20; "No. of Innovation Rewards"; Integer)
        {
            FieldClass = Normal;
        }
        field(21; "No. of Innovation Projects"; Integer)
        {
        }
        field(22; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(23; Published; Boolean)
        {
        }
        field(24; "Created By"; Code[100])
        {
            TableRelation = "User Setup";
        }
        field(25; "Created Date"; Date)
        {
        }
        field(26; "Created Time"; Time)
        {
        }
        field(27; "Dimension Set ID"; Integer)
        {
        }
        field(28; "Portal Status"; Option)
        {
            OptionCaption = ' ,Draft,Submitted,Cancelled';
            OptionMembers = " ",Draft,Submitted,Cancelled;
        }
        field(29; "No. Series"; Code[30])
        {
        }
        field(30; "Lead Name"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if ("Document Type" = "document type"::"Innovation Invitation") then begin
            if "Document No" = '' then begin
                InnovationSetup.Get;
                InnovationSetup.TestField("Idea Invitation Nos");
                NoSeriesMgt.InitSeries(InnovationSetup."Idea Invitation Nos", xRec."No. Series", 0D, "Document No", "No. Series");
            end;
        end;

        if ("Document Type" = "document type"::"Idea Response") then begin
            if "Document No" = '' then begin
                InnovationSetup.Get;
                InnovationSetup.TestField("Idea Capture Form Nos.");
                NoSeriesMgt.InitSeries(InnovationSetup."Idea Capture Form Nos.", xRec."No. Series", 0D, "Document No", "No. Series");
            end;
        end;
        "Created By" := UserId;
        "Created Date" := Today;
        "Document Date" := Today;
    end;

    var
        InnovationSetup: Record "Innovation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        InnovationSolicitation: Record "Innovation Solicitation";
}


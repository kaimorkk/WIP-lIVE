
table 95224 "Audit Execution Finding"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; "Engagement ID"; Code[20])
        {
            Description = '"Audit Execution Checklist"."Engagement ID"';
        }
        field(4; "Checklist ID"; Integer)
        {
            Editable = false;
            TableRelation = "Audit Execution Checklist"."Checklist ID";

            trigger OnValidate()
            begin
                AuditExecutionChecklist.Reset;
                AuditExecutionChecklist.SetRange(AuditExecutionChecklist."Engagement ID", "Engagement ID");
                AuditExecutionChecklist.SetRange(AuditExecutionChecklist."Checklist ID", "Checklist ID");
                if AuditExecutionChecklist.FindSet then begin
                    "Audit Objective ID" := AuditExecutionChecklist."Audit Objective ID";
                    "Audit Procedure ID" := AuditExecutionChecklist."Audit Procedure ID";
                    "Dimension Set ID" := AuditExecutionChecklist."Dimension Set ID";
                    "CheckList Description" := AuditExecutionChecklist.Description;
                end;
            end;
        }
        field(5; "Finding ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(6; Description; Text[2048])
        {
        }
        field(7; "Compliance Status"; Option)
        {
            OptionCaption = ' ,Non-Compliant,Partially Compliant,Substantially Compliant,Fully Compliant,Not Applicable';
            OptionMembers = " ","Non-Compliant","Partially Compliant","Substantially Compliant","Fully Compliant","Not Applicable";
        }
        field(8; "Risk Rating Code"; Code[20])
        {
            TableRelation = "Audit Finding Rating Code".Code where(Blocked = filter(false));

            trigger OnValidate()
            begin
                AuditFindingRatingCode.Reset;
                AuditFindingRatingCode.SetRange(Code, "Risk Rating Code");
                if AuditFindingRatingCode.FindSet then
                    "Risk Heat Zone" := AuditFindingRatingCode."Risk Heat Zone";
            end;
        }
        field(9; Implication; Text[2048])
        {
        }
        field(10; "Affects All Audit Locations"; Boolean)
        {

            trigger OnValidate()
            begin
                if "Affects All Audit Locations" = true then begin
                    AuditProjectLocation.Reset;
                    AuditProjectLocation.SetRange(AuditProjectLocation."Engagement ID", "Engagement ID");
                    if AuditProjectLocation.FindSet then begin
                        repeat
                            AuditFindingLocation.Init;
                            AuditFindingLocation."Document Type" := "Document Type";
                            AuditFindingLocation."Document No." := "Document No.";
                            AuditFindingLocation."Engagement ID" := "Engagement ID";
                            AuditFindingLocation."Checklist ID" := "Checklist ID";
                            AuditFindingLocation."Finding ID" := "Finding ID";
                            AuditFindingLocation."Audit Location" := AuditProjectLocation."Audit Location ID";
                            AuditFindingLocation.Description := AuditProjectLocation.Description;
                            //AuditFindingLocation."Compliance Status":=AuditProjectLocation."Compliance Status";
                            // AuditFindingLocation."Risk Rating Code":=AuditProjectLocation."Risk Rating Code";
                            if not AuditFindingLocation.Insert(true) then
                                AuditFindingLocation.Modify(true);
                        until AuditProjectLocation.Next = 0;
                    end;
                end;
            end;
        }
        field(11; "No. of Audit Recommendations"; Integer)
        {
            CalcFormula = count("Audit Finding Recommendation" where("Document Type" = field("Document Type"),
                                                                      "Document No." = field("Document No."),
                                                                      "Engagement ID" = field("Engagement ID"),
                                                                      "Checklist ID" = field("Checklist ID"),
                                                                      "Finding ID" = field("Finding ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Audit Procedure ID"; Integer)
        {
            TableRelation = "Audit Project Procedure"."Audit Procedure ID" where("Engagement ID" = field("Engagement ID"));

            trigger OnValidate()
            begin
                AuditProjectProcedure.Reset;
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Engagement ID", "Engagement ID");
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Audit Procedure ID", "Audit Procedure ID");
                if AuditProjectProcedure.FindSet then begin
                    "Audit Objective ID" := AuditProjectProcedure."Audit Objective ID";
                end;
            end;
        }
        field(13; "No. of Fieldwork Audit Papers"; Integer)
        {
            CalcFormula = count("Filed Audit Working Paper" where("Engagement ID" = field("Engagement ID"),
                                                                   Blocked = filter(false),
                                                                   "Audit Checklist ID" = field("Checklist ID"),
                                                                   "Fieldwork Audit Finding ID" = field("Finding ID")));
            Description = 'No. of Fieldwork Audit Working Papers';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Audit Objective ID"; Integer)
        {
            TableRelation = "Audit Project Objective"."Audit Objective ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(15; "Dimension Set ID"; Integer)
        {
        }
        field(16; "Fieldwork Audit Finding ID"; Integer)
        {
            TableRelation = "Audit Execution Finding"."Finding ID" where("Engagement ID" = field("Engagement ID"),
                                                                          "Checklist ID" = field("Checklist ID"));
        }
        field(17; "No. of Related Audit Papers"; Integer)
        {
            CalcFormula = count("Filed Audit Working Paper" where("Engagement ID" = field("Engagement ID"),
                                                                   "Fieldwork Audit Finding ID" = field("Finding ID")));
            Description = 'No. of Related Audit Papers';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Management Comment Deadline"; Date)
        {
        }
        field(19; "Mgt Comment Received Date"; Date)
        {
            Description = 'Management Comment Received Date';
        }
        field(20; "Auditee Response Type"; Option)
        {
            OptionCaption = ' ,Agrees with Finding,Disagrees with Findings,Unresponsive ';
            OptionMembers = " ","Agrees with Finding","Disagrees with Findings","Unresponsive ";
        }
        field(21; "No. of Management Comments"; Integer)
        {
            CalcFormula = count("Audit Management Comment" where("Engagement ID" = field("Engagement ID"),
                                                                  "Finding ID" = field("Finding ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Audit Finding Status"; Option)
        {
            OptionCaption = ' ,Open,Closed';
            OptionMembers = " ",Open,Closed;
        }
        field(23; "Management Response Type"; Option)
        {
            OptionCaption = ' ,Agrees with Finding,Disagrees with Findings,Unresponsive';
            OptionMembers = " ","Agrees with Finding","Disagrees with Findings",Unresponsive;
        }
        field(24; "Ganeral Management Comments"; Text[2048])
        {
        }
        field(25; "Posted Finding Entry No."; Integer)
        {
        }
        field(26; "CheckList Description"; Text[2048])
        {
            Editable = false;
        }
        field(27; "Audit Location Code"; Code[20])
        {
            TableRelation = "Audit ProjectLocation"."Audit Location ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(28; "Risk Heat Zone"; Option)
        {
            OptionCaption = ' ,Green,Yellow,Red';
            OptionMembers = " ",Green,Yellow,Red;
        }
        field(29; "Positive Finding Description"; Text[2048])
        {
        }
        field(30; "Compliance Frameworks"; Code[1050])
        {
            TableRelation = "Compliance Framework".Code;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Checklist ID", "Finding ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditExecutionChecklist: Record "Audit Execution Checklist";
        AuditProjectLocation: Record "Audit ProjectLocation";
        AuditFindingLocation: Record "Audit Finding Location";
        AuditProjectProcedure: Record "Audit Project Procedure";
        AuditFindingRatingCode: Record "Audit Finding Rating Code";
}


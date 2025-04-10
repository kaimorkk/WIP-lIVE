page 50193 "Discipline Document"
{
    Caption = 'Grievance Card';
    PageType = Card;
    SourceTable = "Discipline Applications";
    SourceTableView = where(Type = const(Grievance));
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Status = Status::New;
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
            }
            group(Grievance)
            {
                Visible = Type = Type::Grievance;
                Editable = Type = Type::Grievance;
                field("Accused Employee"; Rec."Accused Employee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Accused Employee field.';
                }
                field("Accused Employee Name"; Rec."Accused Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Accused Employee Name field.';
                }
                field("Accused Employee Designation"; Rec."Accused Employee Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Accused Employee Designation field.';
                }
            }
            group(Surcharge)
            {
                Visible = Type = Type::SurCharge;
                Editable = Type = Type::SurCharge;

                field("Value of Property"; Rec."Value of Property")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Value of Property field.';
                }
                field("Description of Property"; Rec."Description of Property")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description of Property field.';
                }

            }
            group(Details)
            {
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                    MultiLine = true;
                }
            }
            group(Logs)
            {

                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }

        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50062),
                              "No." = field("No.");
            }
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000020; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
            action(Submit)
            {
                ApplicationArea = All;
                Visible = Status = Status::New;
                Image = IssueFinanceCharge;
                trigger OnAction()
                begin
                    Rec.SubmitDocument();
                end;
            }

        }
        area(Reporting)
        {
            action("Print")
            {
                ApplicationArea = All;
                Visible = Status = Status::New;
                Image = Report;
                trigger OnAction()
                var
                    DisciplineGrievance: Record "Discipline Applications";
                begin
                    // DisciplineGrievance.Reset();
                    // DisciplineGrievance.SetRange("No.", Rec."No.");
                    // if DisciplineGrievance.FindFirst() then
                    //     Report.Run(Report::"Discipline Application Report", true, false, DisciplineGrievance);

                end;
            }

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Attachments_Promoted; Attachments)
                {
                }
                actionref(Submit_Promoted; Submit)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Grievance;
    end;
}

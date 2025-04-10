

page 95246 "Audit Exit Conference C"
{
    PageType = Card;
    SourceTable = "Audit Execution Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting No.';
                    ToolTip = 'Specifies the value of the Meeting No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Audit Commencement Notice No."; Rec."Audit Commencement Notice No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Audit Commencement Notice No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Engagement Name"; Rec."Engagement Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
                field("Closed DateTime"; Rec."Closed DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed DateTime field.';
                }
            }
            part("Entrance Meeting Agenda"; "Audit Exit Conference Agenda L")
            {
                Caption = 'Audit Exit Conference Agenda';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Meeting Summary")
            {
                ApplicationArea = Basic;
                Image = "Report";
                ToolTip = 'Executes the Meeting Summary action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(95020, true, true, Rec);
                end;
            }
            action(Close)
            {
                ApplicationArea = Basic;
                Image = CloseYear;
                ToolTip = 'Executes the Close action.';
                trigger OnAction()
                begin
                    AuditProject.Reset;
                    AuditProject.SetRange(AuditProject."Engagement ID", Rec."Engagement ID");
                    if AuditProject.FindSet then begin
                        Rec.Closed := true;
                        Rec."Closed By" := UpperCase(UserId);
                        Rec."Closed DateTime" := CreateDatetime(Today, Time);
                        Rec.Modify;
                    end;
                    Message('Audit Exit Meeting closed successfully');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                RunObject = Page "Dimension Set Entries";
                ToolTip = 'Executes the Dimensions action.';
            }
            action(Attendance)
            {
                ApplicationArea = Basic;
                Image = AllocatedCapacity;
                RunObject = Page "Entrace Meeting Attendances";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Attendance action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Close_Promoted; Close)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Attendance_Promoted; Attendance)
                {
                }
            }
            group(Category_Report)
            {
                actionref("Meeting Summary_Promoted"; "Meeting Summary")
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Closed = true then
            CurrPage.Editable := false;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.Closed = true then
            CurrPage.Editable := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Audit Exit Conference";
    end;

    trigger OnOpenPage()
    begin
        if Rec.Closed = true then
            CurrPage.Editable := false;
    end;

    var
        AuditProject: Record "Audit Project";
}

#pragma implicitwith restore


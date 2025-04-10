

page 69282 "Processe Training Applications"
{
    CardPageID = "Closed Training Application";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Training Requests";
    SourceTableView = where(Status = filter(Closed));


    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Start DateTime"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                    Caption = 'Estimated Cost';
                }
                field("Total Procurement Cost"; Rec."Total Procurement Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Provider; Rec."Planned Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Total Per diem Costs"; Rec."Total Per diem Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = true;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755002; "Trainings Factbox")
            {
                SubPageLink = Code = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Training Applications List")
            {
                ApplicationArea = Basic;
                Caption = 'Training Applications List';
                Image = "Report";
                //  RunObject = Report UnknownReport39005603;
            }
            action("Training Applications")
            {
                ApplicationArea = Basic;
                Caption = 'Training Applications';
                Image = "Report";
                //    RunObject = Report UnknownReport39005580;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Upload Documents';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                actionref("Training Applications List_Promoted"; "Training Applications List")
                {
                }
                actionref("Training Applications_Promoted"; "Training Applications")
                {
                }
            }
            group(Category_Category9)
            {
                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore


page 80472 "Supplementary Budget"
{
    Caption = 'Supplementary Budget';
    PageType = Card;
    SourceTable = "Budget Control Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Approved WorkPlan"; Rec."Approved WorkPlan")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved WorkPlan field.', Comment = '%';
                }
                field("Corporate Strategy"; Rec."Corporate Strategy")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Corporate Strategy field.', Comment = '%';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financial Year field.', Comment = '%';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
                }

                field(Budget; Rec.Budget)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget field.', Comment = '%';
                }
            }
            Part("Lines"; "Supplementary Lines")
            {
                Caption = 'Setup Lines';
                ApplicationArea = Basic, Suite;
                SubPageLink = No = field(No);
            }
            Part("Revision Lines"; "Workplan Revision Lines1")
            {
                Caption = 'Affected Workplans';
                ApplicationArea = Basic, Suite;
                SubPageLink = No = field(No);
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Initialize)
            {
                Image = ActivateDiscounts;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.InitializeSupplementaryLines();
                end;
            }
            action(Generate)
            {
                Image = ActivateDiscounts;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.GenerateSupplementaryLines();
                end;
            }
            action("Submit for Revision")
            {
                Image = ReverseLines;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.SubmitForRevision();
                end;
            }

            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                trigger OnAction()
                var
                    // DMSManagement: Codeunit "Sharepoint Integration";
                    DocType: Enum SharepointDocumentType;
                begin
                    DocType := DocType::"Supplementary Budget";
                    // DMSManagement.GetDocument(DocType, Rec.No, Rec.RecordID, 'FNC', 50127, 'Supplementary Budget');

                end;
            }
            action("View EDMS Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;

                // trigger OnAction()
                // var
                //     attachLink: Record Attachments;
                // begin

                //     attachLink.setRange(attachLink.Document_No, Rec.No);
                //     if attachLink.FindSet then
                //         Page.Run(Page::Attachments, attachLink)
                //     else
                //         Error('No attached links found');
                // end;
            }



        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Initialize_Promoted; Initialize)
                {
                }
                actionref(Generate_Promoted; Generate)
                {
                }
                actionref("Submit for Revision_Promoted"; "Submit for Revision")
                {
                }
            }
            group(Category_Category6)
            {
                actionref("Attach Documents_Promoted"; "Attach Documents")
                {
                }
                actionref("View EDMS Attach Documents_Promoted"; "View EDMS Attach Documents")
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        //if Rec."Approval Status" <> Rec."Approval Status"::Open then
        //  CurrPage.Editable := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::"Supplementary Budget";
    end;
}

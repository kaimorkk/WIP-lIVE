

page 69310 "Training Courses Needs"
{
    PageType = ListPart;
    SourceTable = "Training Courses Needs";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Training Need Code"; Rec."Training Need Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Training Need Description"; Rec."Training Need Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        Report.Run(69122, true, true, Rec);
                    end;
                }
                action("&Send Approval &Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval &Request';
                    Image = SendApprovalRequest;
                }
                action("&Cancel Approval request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval request';
                    Image = Cancel;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintForm;
                }
                separator(Action14)
                {
                }
                group(ActionGroup21)
                {
                    action("Import Needs")
                    {
                        ApplicationArea = Basic;
                        Image = Import;
                        //   RunObject = XMLport UnknownXMLport69300;

                        trigger OnAction()
                        begin
                            //ImportTrainingNeeds.GetRec(Rec);
                            //     ImportTrainingNeeds.Run();
                        end;
                    }
                }
            }
        }
    }

    var
    //   ImportTrainingNeeds: XmlPort UnknownXmlPort69300;
}

#pragma implicitwith restore


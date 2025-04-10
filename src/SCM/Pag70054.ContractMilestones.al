

page 70054 "Contract Milestones"
{
    PageType = List;
    SourceTable = "Contract Milestones";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Milestone No"; Rec."Milestone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Milestone No field.';
                }
                field("Milestone Description"; Rec."Milestone Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Milestone Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date of Approval"; Rec."Date of Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Approval field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved By field.';
                }
                field("LPO Generated"; Rec."LPO Generated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the LPO Generated field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Generate Purchase Order")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Purchase Order';
                Image = CreateBinContent;
                ToolTip = 'Executes the Generate Purchase Order action.';
                trigger OnAction()
                begin
                    ContMngtHeader.Reset;
                    ContMngtHeader.SetRange(Code, Rec."Contract Header");
                    ContMngtHeader.SetRange("Requires Milestone", true);
                    if ContMngtHeader.Find('-') then begin

                        TenderRec.Reset;
                        TenderRec.SetRange(No, ContMngtHeader."Tender No");
                        if TenderRec.Find('-') then begin

                            if PurchReq.Get(TenderRec."Requisition No") then
                                if PurchReq.Status = PurchReq.Status::Released then begin

                                    if Confirm('Are u sure u want to generate Orders for the selected Vendor(s)', true) then begin
                                        //IF USERID = PurchReq."Assigned User ID" THEN
                                        PurchReq.CreatePurchaseOrder(PurchReq)
                                        //ELSE ERROR( 'User %1 has not been assigned permission to generate Purchase Order for this requisition',USERID);
                                    end else
                                        exit;

                                end else
                                    Error(Text000);

                        end else
                            Error('There is no tender document attached to this contract');

                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Generate Purchase Order_Promoted"; "Generate Purchase Order")
                {
                }
            }
        }
    }

    var
        PurchReq: Record "Requisition Header1";
        TenderRec: Record "Procurement Request";
        Text000: label 'The Status has to be Released';
        Text001: label 'A Purchase Order has already been created for this Requisition';
        ContMngtHeader: Record "Contract Management Header";
}

#pragma implicitwith restore


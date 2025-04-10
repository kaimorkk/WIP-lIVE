#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 72060 "Project Funding Voucher Card"
{
    PageType = Card;
    SourceTable = "Project Funding Request Vouche";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Default Works Category"; Rec."Default Works Category")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Default Funding Source"; Rec."Default Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Total Value(LCY)"; Rec."Funding Total Value(LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Estimated Cost(LCY)';
                    Editable = false;
                }
            }
            part(Control25; "Project Funding Voucher Line")
            {
                Caption = 'Road Work Sections';
                SubPageLink = "Document No" = field("Document No");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control21; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    // //if //ApprovalsMgmt.C THEN
                    // //ApprovalsMgmt.OnSendImpMemoForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('APproval Request has  been canceled');
                end;
            }
            action("Approval Entries")
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Consolidate)
            {
                ApplicationArea = Basic;
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    FnDeleteOldEntriesForSameDocNo();
                    FnConsolidateEntries();
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::PFV;
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ObjConsolidatedFunding: Record "Consolidated Project Funding R";
        ObjProjFundVLine: Record "Project Funding Voucher Line";

    local procedure FnDeleteOldEntriesForSameDocNo()
    begin
        ObjConsolidatedFunding.Reset;
        ObjConsolidatedFunding.SetRange(ObjConsolidatedFunding."Document No", Rec."Document No");
        if ObjConsolidatedFunding.FindSet then
            ObjConsolidatedFunding.DeleteAll;
    end;

    local procedure FnConsolidateEntries()
    begin
        ObjProjFundVLine.Reset;
        ObjProjFundVLine.SetRange(ObjProjFundVLine."Document No", Rec."Document No");
        if ObjProjFundVLine.FindSet then
            repeat
                ObjConsolidatedFunding.Init;
                ObjConsolidatedFunding.TransferFields(ObjProjFundVLine);
                ObjConsolidatedFunding.Insert(true);
                Message(Format(ObjConsolidatedFunding));
            until ObjProjFundVLine.Next = 0;
        Message('Consolidated Successfully');
    end;
}

#pragma implicitwith restore


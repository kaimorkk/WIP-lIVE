

page 70031 "Procurement Request Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Procurement Request Lines";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Item"; Rec."Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Budget Line"; Rec."Budget Line")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                }
                field(Ordered; Rec.Ordered)
                {
                    ApplicationArea = Basic;
                }
                field(Activity; Rec.Activity)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate Purchase Order")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Purchase Order';
                Image = CreateBinContent;
                Visible = true;

                trigger OnAction()
                begin
                    Rec.TestField("Vendor No");
                    Rec.TestField("Supplier Category");
                    if not Confirm('Do you want to Generate the Order?') then
                        exit;

                    KasnebFunctions.CreateLPOFromLines(Rec);
                end;
            }
            action(DocAttach)
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
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
    }

    var
        ProcReq: Record "Procurement Request";
        PurchReq: Record "Purchase Header";
        ProcReqLines: Record "Purchase Line";
        filecu: Codeunit "File Management";
        filename: Text;
        PURCHSETUP: Record "Purchases & Payables Setup";
        Lineno: Integer;
        RequsitionManager: Codeunit "Requisition Management";
        UserSetup: Record "User Setup";
        Text004: label 'Do you want to proceed and perform the selected action on the purchase requisition lines?';
        NoOfVendors: Decimal;
        KasnebFunctions: Codeunit KasnebFunctions;
}

#pragma implicitwith restore


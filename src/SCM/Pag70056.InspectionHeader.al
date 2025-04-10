page 70056 "Inspection Header"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Inspection Header1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(InspectionNo; "Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(OrderNo; "Order No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(CommiteeAppointmentNo; "Commitee Appointment No")
                {
                    ApplicationArea = Basic;
                }
                field(InspectionDate; "Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field(SupplierName; "Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field(GeneralCommitteRemarks; "General Committe Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Committees Remarks';
                }
                field(DeliveryNoteNo; "Delivery Note No.")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000012; "Inspection Lines")
            {
                Caption = 'Inspection Lines';
                SubPageLink = "Inspection No" = field("Inspection No");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                // action(SendRequestforApproval)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Send Request for Approval';
                //     Image = Approve;
                //     Promoted = true;

                //     trigger OnAction()
                //     begin
                //         //IF ApprovalMgt.SendInspectionApproval(Rec) THEN;
                //     end;
                // }
                // action(CancelRequestforApproval)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Cancel Request for Approval';
                //     Image = CancelApprovalRequest;
                //     Promoted = true;

                //     trigger OnAction()
                //     begin
                //         //IF ApprovalMgt.CancelInspectApprovalRequest(Rec,TRUE,TRUE) THEN;
                //     end;
                // }
                action(ViewContractOrder)
                {
                    ApplicationArea = Basic;
                    Caption = 'View Contract/Order';
                    Image = "Order";
                    RunObject = Page "Purchase Order";
                    RunPageLink = "No." = field("Order No");
                }
                action(InspectionCertificate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Inspection Certificate';
                    Image = PrintReport;

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter("Inspection No", "Inspection No");
                        Report.Run(70006, true, true, Rec);
                        Reset;
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
                action(Submit)
                {
                    ApplicationArea = All;
                    Caption = 'Submit';
                    Image = Post;

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Open);
                        PurchaseLine.Reset;
                        PurchaseLine.SetRange(PurchaseLine."Document No.", "Order No");
                        //PurchaseLine.SETRANGE("Document Type",PurchaseLine."Document Type"::Order);
                        if PurchaseLine.FindSet then begin
                            repeat
                                InspectionLines1.Reset;
                                InspectionLines1.SetRange("Inspection No", "Inspection No");
                                InspectionLines1.SetRange("Line No", PurchaseLine."Line No.");
                                if InspectionLines1.FindSet then begin
                                    PurchaseLine."Qty. to Receive" := InspectionLines1."Quantity Received";
                                    PurchaseLine."Qty. to Invoice" := InspectionLines1."Quantity Received";
                                    PurchaseHeader.Reset;
                                    PurchaseHeader.SetRange("No.", "Order No");
                                    PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::Order);
                                    if PurchaseHeader.FindFirst then
                                        PurchaseLine."Buy-from Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                    PurchaseLine."Pay-to Vendor No." := PurchaseHeader."Buy-from Vendor No.";
                                    InspectionLines1."Received Qty" := InspectionLines1."Quantity Received";
                                    PurchaseLine.Modify(true);
                                end;
                                if PurchaseLine.Modify(true) then begin
                                    PurchaseLine.Validate(Quantity);
                                end;
                                InspectionLines1.Modify(true);
                            until PurchaseLine.Next = 0;
                            Rec.Status := Rec.Status::Submitted;
                            Message('Submitted sucessfully');
                        end;


                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(ViewContractOrder_Promoted; ViewContractOrder)
                {
                }
            }
            group(Category_Report)
            {
                actionref(InspectionCertificate_Promoted; InspectionCertificate)
                {
                }
            }
            group(Category_Category5)
            {
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
                actionref(Submit_Promoted; Submit)
                {
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        PurchaseLine: Record "Purchase Line";
        InspectionLines1: Record "Inspection Lines1";
        InspectionHeader1: Record "Inspection Header1";
        PurchaseHeader: Record "Purchase Header";
}


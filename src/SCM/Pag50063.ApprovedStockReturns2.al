

page 50000 "Approved Stock Returns2"
{
    Caption = 'Purchase Order';
    Editable = true;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter("Store Requisition"),
                            Status = const(Released),
                            Replenishment = const(false),
                            "Fully Issued" = const(false),
                            "Requisition Type" = const("Stock Return"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request-By No. field.';
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request-By Name field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                    Editable = false;
                    ToolTip = 'Specifies the date when the order was created.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition Type field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the code of the currency of the amounts on the purchase lines.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the number of archived versions for this document.';
                }
                field("Taken By"; Rec."Taken By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taken By field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the posting of the purchase document will be recorded.';
                }
            }
            part(PurchLines; "Approved SR Subform")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control1903326807; "Item Replenishment FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "No." = field("No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control3; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "No." = field("No."),
                              "Line No." = field("Line No.");
                ApplicationArea = Basic;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.SetRecordFilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Posted Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Entries';
                    Image = ViewPostedOrder;
                    RunObject = Page "Value Entries";
                    RunPageLink = "Document No." = field("No.");
                    ToolTip = 'Executes the Posted Entries action.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("Post Record")
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    ShortCutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Purch.-Post (Yes/No)");


                        if Confirm('Are you sure you would like to Post this requisition?', false) = true then begin
                            Rec.TestField("Taken By");

                            //if
                            ItemGnl.Reset;
                            ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                            ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                            ItemGnl.DeleteAll;
                            /*
                           JLDim.RESET;
                           JLDim.SETRANGE(JLDim."Table ID",83);
                           JLDim.SETRANGE(JLDim."Journal Template Name",'ITEM');
                           JLDim.SETRANGE(JLDim."Journal Batch Name",'REQ');
                            JLDim.DELETEALL;
                           */


                            ItemGnl.Reset;
                            ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                            ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                            if ItemGnl.FindLast then
                                Linenumber := ItemGnl."Line No."
                            else
                                Linenumber := 10000;
                            //MESSAGE('%1',Linenumber);

                            RequisitionLine.Reset;

                            RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
                            RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
                            RequisitionLine.SetRange(RequisitionLine.Type, RequisitionLine.Type::Item);

                            RequisitionLine.SetRange(RequisitionLine.Select, true);
                            //RequisitionLine.SETRANGE(RequisitionLine."HOD Action",RequisitionLine."HOD Action"::Approved);
                            //RequisitionLine.GET(RequisitionLine."Journal Batch Name");
                            if RequisitionLine.Find('-') then begin
                                repeat
                                    //MESSAGE('RERE');
                                    //MESSAGE("Requisition No.");

                                    if RequisitionLine."Quantity To  Issue" = 0 then
                                        Error('YOU CANNOT POST ZERO QUANTITIES.PLEASE CHECK!!');

                                    ItemGnl.Init;

                                    ItemGnl."Journal Template Name" := 'ITEM';
                                    ItemGnl."Journal Batch Name" := 'REQ';
                                    ItemGnl."Document No." := Rec."No.";
                                    //ItemGnl."Quantity Requested":=RequisitionLine.Quantity;
                                    //ItemGnl."Posting Date":=20070201D;
                                    ItemGnl."Posting Date" := RequisitionLine."Order Date";
                                    ItemGnl."Entry Type" := ItemGnl."entry type"::"Positive Adjmt.";
                                    ItemGnl."Item No." := RequisitionLine."No.";
                                    ItemGnl.Validate("Item No.");
                                    ItemGnl.Description := RequisitionLine.Description;
                                    //ItemGnl."Job No.":=RequisitionLine."Job No.";
                                    ItemGnl."Location Code" := RequisitionLine."Location Code";
                                    //ItemGnl.VALIDATE(ItemGnl."Job No.");
                                    //ItemGnl."Job Task No.":=RequisitionLine."Job Task No.";
                                    //ItemGnl.VALIDATE(ItemGnl."Job Task No.");
                                    //Ushindi
                                    ItemGnl."Gen. Bus. Posting Group" := RequisitionLine."Gen. Bus. Posting Group";

                                    //End of Ushindi changes
                                    ItemGnl.Quantity := RequisitionLine."Quantity To  Issue";
                                    ItemGnl.Validate(Quantity);
                                    ItemGnl."Unit of Measure Code" := RequisitionLine."Unit of Measure Code";
                                    ItemGnl.Validate("Unit of Measure Code");
                                    ItemGnl."Unit Amount" := RequisitionLine."Direct Unit Cost";
                                    ItemGnl.Validate("Unit Amount");
                                    //ItemGnl.VALIDATE(Quantity);
                                    //ItemGnl."Dimension Set ID":=RequisitionLine."Dimension Set ID";

                                    ItemGnl.CopyDim(RequisitionLine."Dimension Set ID");



                                    // ItemGnl."ISBN No.":="Taken By";
                                    ItemGnl."Line No." := Linenumber + 10000;
                                    ItemGnl.Insert;



                                    Linenumber := Linenumber + 10000;
                                until RequisitionLine.Next = 0;


                                /*
                                ItemGnl.RESET;
                                ItemGnl.SETRANGE(ItemGnl."Journal Template Name",'ITEM');
                                ItemGnl.SETRANGE(ItemGnl."Journal Batch Name",'REQ');

                                IF ItemJnlLine.FIND('-') THEN BEGIN
                                REPEAT
                                //i:=0;
                                DocDimen.RESET;
                                DocDimen.SETRANGE(DocDimen."Table ID",38);
                                DocDimen.SETRANGE(DocDimen."Document Type",DocDimen."Document Type"::"Store Requisition");
                                DocDimen.SETRANGE(DocDimen."Document No.",ItemJnlLine."Document No.");
                                //DocDimen.SETRANGE(DocDimen."Line No.",RequisitionLine."Line No.");

                                IF DocDimen.FIND('-') THEN BEGIN
                                REPEAT

                                JLDim.INIT;
                                JLDim."Table ID":=83;
                                JLDim.VALIDATE("Table ID");
                                JLDim."Journal Template Name":='ITEM';
                                JLDim.VALIDATE("Journal Template Name");
                                JLDim."Journal Batch Name":='REQ';
                                JLDim.VALIDATE("Journal Batch Name");
                                JLDim."Journal Line No.":=ItemJnlLine."Line No.";
                                JLDim.VALIDATE("Journal Line No.");

                                JLDim."Allocation Line No.":=0;
                                JLDim.VALIDATE(JLDim."Allocation Line No.");

                                JLDim."Dimension Code":=DocDimen."Dimension Code";
                                JLDim.VALIDATE("Dimension Code");
                                JLDim."Dimension Value Code":=DocDimen."Dimension Value Code";
                                JLDim.VALIDATE("Dimension Value Code");
                                JLDim."New Dimension Value Code":='';
                                JLDim.VALIDATE(JLDim."New Dimension Value Code");
                                JLDim.INSERT(TRUE);
                                //JLDim.VALIDATE("Dimension Value Code");
                                //MESSAGE('%1',Linenumber);

                                //i:=i+1;
                                UNTIL DocDimen.NEXT=0;
                                END;

                                UNTIL ItemJnlLine.NEXT=0;
                                END;
                                */



                                //post journal.
                                ItemGnl.Reset;
                                ItemGnl.SetRange(ItemGnl."Journal Template Name", 'ITEM');
                                ItemGnl.SetRange(ItemGnl."Journal Batch Name", 'REQ');
                                //ItemGnl.SETRANGE(ItemGnl."Document No.","Requisition No.");
                                Codeunit.Run(Codeunit::"Item Jnl.-Post", ItemGnl);


                            end else begin
                                //ERROR('YOU HAVE NOT SELECTED ANY LINE.PLEASE CHECK!!');
                            end;

                            //END;



                            Rec."Taken By" := '';
                            Rec.Modify;
                            RequisitionLine.Reset;
                            RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
                            RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
                            RequisitionLine.SetRange(RequisitionLine.Select, true);
                            if RequisitionLine.Find('-') then begin
                                repeat
                                    RequisitionLine."Last Issued By" := UserId;
                                    RequisitionLine."Last Issue date" := Today;
                                    RequisitionLine."Last Issue Time" := Time;
                                    RequisitionLine."Quantity  issued" := RequisitionLine."Quantity  issued" + RequisitionLine."Quantity To  Issue";
                                    RequisitionLine."Quantity To  Issue" := 0;
                                    RequisitionLine.Select := false;
                                    if RequisitionLine."Quantity  issued" = RequisitionLine."Qty. Requested" then begin
                                        RequisitionLine."Fully Issued" := true;
                                    end;
                                    RequisitionLine.Modify;
                                until RequisitionLine.Next = 0;

                            end;


                            RequisitionLine.Reset;
                            RequisitionLine.SetRange(RequisitionLine."Document No.", Rec."No.");
                            RequisitionLine.SetRange(RequisitionLine."Document Type", Rec."Document Type");
                            RequisitionLine.SetRange(RequisitionLine."Fully Issued", false);

                            if RequisitionLine.Count > 0 then begin
                                //"Fully Issued":=TRUE;
                                //MODIFY;
                            end else begin
                                Rec."Fully Issued" := true;
                                Rec.Modify;

                            end;



                        end;


                        /*
                        
                        Req.RESET;
                        Req.SETRANGE(Req."Requisition No.","Requisition No.");
                        
                        REPORT.RUN(51061,TRUE,TRUE,Req);
                        END;
                        
                        */

                    end;
                }
                separator(Action611)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(50095, true, true, Rec)
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Process)
            {
                actionref("Post Record_Promoted"; "Post Record")
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
        end;
    end;

    var
        //  ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;

        JobQueueVisible: Boolean;
        PurchSetupRec: Record "Purchases & Payables Setup";
        ItemJnlTemplate: Record "Item Journal Template";
        ItemJnlBatch: Record "Item Journal Batch";
        ItemJnlLine: Record "Item Journal Line";
        StoreReqHeader: Record "Purchase Header";
        StoreReqLine: Record "Purchase Line";
        ItemGnl: Record "Item Journal Line";
        RequisitionLine: Record "Purchase Line";
        Linenumber: Integer;
        Req: Record "Purchase Header";
        Dim: Record "Dimension Set Entry";

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        if Rec.GetFilter("Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
            if Rec."Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
                Rec.SetRange("Buy-from Vendor No.");
        CurrPage.Update;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update;
    end;
}

#pragma implicitwith restore


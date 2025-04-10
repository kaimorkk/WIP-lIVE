page 70001 "Pre Qualified Suppliers"
{
    Caption = 'Pre Qualified Received';
    PageType = List;
    SourceTable = "Prequalified Suppliers1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Fiscal Year"; Rec."Fiscal Year")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;

                    trigger OnValidate()
                    var
                        rec1: Record "Supplier Selection1";
                    begin
                        if Rec.Selected = true then begin
                            if bdno2 <> '' then begin
                                //ERROR('...1');
                                Rec."Ref No." := bdno2;
                                Rec.Validate("Ref No.");
                                rec1.Reset;
                                rec1.Init;
                                rec1."Reference No." := Rec."Ref No.";
                                rec1."Vendor No" := Rec."Vendor No";
                                rec1."Supplier Name" := Rec.Name;
                                rec1."Supplier Category" := Rec.Category;
                                rec1.Insert;
                                Rec."Ref No." := bdno2;

                            end;
                        end;
                        if Rec.Selected = true then begin
                            //"Ref No.":='';
                        end;

                        if Rec.Selected = false then begin
                            if bdno2 <> '' then begin
                                rec1.Reset;
                                rec1.SetFilter(rec1."Reference No.", Rec."Ref No.");
                                //rec1.SETFILTER(rec1."Vendor No","Vendor No");
                                rec1.SetFilter(rec1."Supplier Name", '%1', Rec.Name);
                                rec1.SetFilter(rec1."Supplier Category", '%1', Rec.Category);
                                if rec1.FindSet then begin
                                    rec1.Delete;
                                end;
                            end;
                        end;
                    end;
                }
                field("E-mail"; Rec."E-mail")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Company PIN No"; Rec."Company PIN No")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Physical Address"; Rec."Physical Address")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Mobile No"; Rec."Mobile No")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Supplier Type"; Rec."Supplier Type")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Director 1 Name"; Rec."Director 1 Name")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Director 2 Name"; Rec."Director 2 Name")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Director 3 Name"; Rec."Director 3 Name")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Ref No."; Rec."Ref No.")
                {
                    ApplicationArea = Basic;
                    Editable = seetitbl;
                }
                field("Pre Qualified"; Rec."Pre Qualified")
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
            action("Start Evaluation")
            {
                ApplicationArea = Basic;
                Image = SetupPayment;
                Visible = seetit2;

                trigger OnAction()
                var
                    rec2: Record "Quotations Evaluation";
                    rec3: Record "Procurement Request";
                    rec5: Record "Procurement Request";
                    rec7: Record "Quotations Evaluation";
                    rec8: Record "Quotations Evaluation";
                    reqlines: Record "Procurement Request Lines";
                    rec9: Record "Quotations Evaluation";
                    rec10: Record "Quotations Evaluation";
                    I: Integer;
                    J: Integer;
                    rec51: Record "Quotations Evaluation";
                begin
                    rec3.Reset;
                    if rec3.Get(bdno2) then begin
                        if rec3."In Technical?" = true then begin
                            // ERROR('Technical Evaluation has already happened for this Quotation...');
                        end;
                    end;
                    rec2.Reset;

                    Rec.SetFilter(Selected, '%1', true);
                    if Rec.FindSet then
                        repeat
                            rec2.Init;
                            rec2.TransferFields(Rec);
                            rec2."Ref No." := bdno2;
                            rec2.Insert;
                            //added to be pushed to bidders
                            ProcurementLines.Reset;
                            ProcurementLines.SetRange(ProcurementLines."Requisition No", Rec."Ref No.");
                            if ProcurementLines.Find('-') then
                                repeat
                                    TenderBids.Reset;
                                    TenderBids.SetRange(contactNo, Rec."Contact No");
                                    TenderBids.SetRange("Requisition No", Rec."Ref No.");
                                    TenderBids.SetFilter(Amount, '<>%1', 0);
                                    if TenderBids.FindSet then begin
                                        TenderBids."Bidder Name" := Rec.Name;
                                        TenderBids."Bidder Email" := Rec."E-mail";
                                        TenderBids.Type := ProcurementLines.Type;
                                        TenderBids.No := ProcurementLines.No;
                                        TenderBids.Description := ProcurementLines.Description;
                                        //IF NOT TenderBids.GET(TenderBids."Requisition No",TenderBids."Bidder Name",TenderBids."Bidder Email") THEN
                                        TenderBids.Modify;
                                    end else begin
                                        TenderBids."Requisition No" := Rec."Ref No.";
                                        TenderBids."Bidder Name" := Rec.Name;
                                        TenderBids."Bidder Email" := Rec."E-mail";
                                        TenderBids.Type := ProcurementLines.Type;
                                        TenderBids.No := ProcurementLines.No;
                                        TenderBids.Description := ProcurementLines.Description;
                                        if not TenderBids.Get(TenderBids."Requisition No", TenderBids."Bidder Name", TenderBids."Bidder Email") then
                                            TenderBids.Insert;
                                    end;
                                until ProcurementLines.Next = 0;

                        until Rec.Next = 0;




                    Message('Evaluation can begin in a separate Menu...');


                    rec3.Reset;
                    rec3.Get(bdno2);
                    rec3."In Technical?" := true;
                    rec3.Modify;

                    if rec3."Does Not Require TOR" = true then begin
                        //==========================================================================================================================
                        rec5.Reset;
                        rec5.Get(Rec."Ref No.");

                        if rec5."In Financial?" = true then begin
                            Error('The Quotation is already in Financial stage. Please Find it in the next stage.');
                        end;
                        //ERROR('%1',"Ref No.");
                        rec51.Reset;
                        rec51.SetFilter(rec51."Ref No.", Rec."Ref No.");
                        rec51.SetFilter("Passes Technical?", '%1', true);
                        if Rec.FindSet then begin
                            Message('Finanncial Evaluation can begin in a separate Menu..');
                            rec5.Reset;
                            rec5.Get(Rec."Ref No.");
                            rec5."In Financial?" := true;
                            rec5.Modify;
                            //====================================================
                            rec7.Reset;
                            rec7.SetFilter(rec7."Ref No.", Rec."Ref No.");
                            rec7.SetFilter(rec7."Passes Technical?", '%1', true);
                            rec7.SetFilter(rec7.created, '%1', false);
                            if rec7.FindSet then begin
                                I := 10;
                                repeat
                                    dialogbd.Open('Creating Entries for ##1');
                                    reqlines.Reset;
                                    reqlines.SetFilter(reqlines."Requisition No", Rec."Ref No.");
                                    reqlines.SetFilter(reqlines.Description, '<>%1', '');
                                    if reqlines.FindSet then
                                        repeat
                                            rec9.Init;
                                            rec9.Copy(rec7);
                                            rec9.entryno := I;
                                            rec9."Item Description" := reqlines.Description;
                                            rec9.created := true;
                                            rec9.Insert;
                                            dialogbd.Update(1, rec9.Name);
                                            Sleep(1000);
                                            //MESSAGE('%1..%2..%3',rec9.Name,rec9."Item Description",i);
                                            I += 10;
                                        until reqlines.Next = 0;
                                    dialogbd.Close;
                                until rec7.Next = 0;
                            end;
                            //====================================================
                            CurrPage.Close;
                        end;
                        if not Rec.FindSet then begin
                            Error('No Supplier has passed Technical Specification...!!!');
                        end;
                        //==========================================================================================================================
                    end;
                    CurrPage.Close;
                end;
            }
            action(Bidders)
            {
                ApplicationArea = Basic;
                //  RunObject = Page Bidders;
                Visible = false;
            }
            action(Create)
            {
                ApplicationArea = Basic;
                Caption = 'Create';
                Image = CustomerContact;

                trigger OnAction()
                begin
                    if Rec."Pre Qualified" = true then
                        Rec.CreateVend(Rec);
                end;
            }
            action("Load Prequalified Suppliers")
            {
                ApplicationArea = Basic;
                Image = Lock;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec.Category, Rec.Category);
                    Rec.SetRange(Rec."Vendor No", '');
                    if Rec.FindSet then begin
                        PreQualifiedSuppliers.SetTableview(Rec);
                        PreQualifiedSuppliers.Run;
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Create_Promoted; Create)
                {
                }
                actionref("Load Prequalified Suppliers_Promoted"; "Load Prequalified Suppliers")
                {
                }
            }
            group(Category_Process)
            {
                actionref("Start Evaluation_Promoted"; "Start Evaluation")
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if bdno2 <> Rec."Ref No." then begin
            Rec.Selected := false;
            Rec."Ref No." := '';
        end;
    end;

    trigger OnOpenPage()
    begin
        seetitbl := true;
        recit.Reset;
        if recit.Get(bdno2) then begin
            if recit.Status <> recit.Status::Open then begin
                seetitbl := false;
            end;
            if recit."Quotation Evaluation" = true then begin
                seetit2 := true;
                seetitbl := true
            end;
        end;
    end;

    var
        bdno2: Code[20];
        seetitbl: Boolean;
        recit: Record "Procurement Request";
        seetit2: Boolean;
        dialogbd: Dialog;
        ProcurementLines: Record "Procurement Request Lines";
        TenderBids: Record "Tender Bids";
        PreQualifiedSuppliers: Page "Pre Qualified Suppliers";


    procedure GetRefnopg(bdno: Code[20])
    begin
        bdno2 := bdno;
    end;
}

#pragma implicitwith restore


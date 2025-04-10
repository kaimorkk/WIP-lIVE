

page 70066 "Technical Evaluation"
{
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = List;
    SourceTable = "Quotations Evaluation";
    SourceTableView = where(created = const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Ref No."; Rec."Ref No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Physical Address"; Rec."Physical Address")
                {
                    ApplicationArea = Basic;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("E-mail"; Rec."E-mail")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile No"; Rec."Mobile No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec."Minimum Order Quantity")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec."Minimum Order Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Passes Technical?"; Rec."Passes Technical?")
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
            action("Attach Technical Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;

                trigger OnAction()
                var
                    torpath: Record "Purchases & Payables Setup";
                    filename: Text;
                    filecu: Codeunit "File Management";
                    rec5: Record "Procurement Request";
                begin
                    //filename:=filecu.OpenFileDialog('Select Technical File(s)','Technical File','*.PDF|*.*');
                    if filename <> '' then begin
                        if filecu.GetExtension(filename) <> 'pdf' then begin
                            Error('You can Only Attach PDF Files!!!');
                        end;
                        torpath.Reset;
                        torpath.Get;
                        torpath.TestField(torpath."RFQ Documents Path");
                        rec5.Reset;
                        rec5.Get(Rec."Ref No.");
                        // filecu.CopyClientFile(filename,torpath."RFQ Documents Path"+"Ref No."+'_'+filecu.GetFileName(filename),true);
                        Message('File Selected Successfully!');
                        rec5."Technical Minutes" := torpath."RFQ Documents Path" + Rec."Ref No." + '_' + filecu.GetFileName(filename);
                        rec5.Modify;
                    end;
                end;
            }
            action("View Technical Documents")
            {
                ApplicationArea = Basic;
                Image = Documents;

                trigger OnAction()
                var
                    rec5: Record "Procurement Request";
                begin
                    rec5.Reset;
                    rec5.Get(Rec."Ref No.");

                    if rec5."Technical Minutes" <> '' then
                        Hyperlink(rec5."Technical Minutes");
                end;
            }
            action("Proceed to Financial")
            {
                ApplicationArea = Basic;
                Image = CashFlow;

                trigger OnAction()
                var
                    rec5: Record "Procurement Request";
                    rec7: Record "Quotations Evaluation";
                    rec8: Record "Quotations Evaluation";
                    reqlines: Record "Procurement Request Lines";
                    rec9: Record "Quotations Evaluation";
                    rec10: Record "Quotations Evaluation";
                    I: Integer;
                    J: Integer;
                begin
                    //commented FOR purpose OF testing
                    /*rec5.RESET;
                    rec5.GET("Ref No.");
                    IF rec5."Technical Minutes"='' THEN BEGIN
                       ERROR('Please Attach Technical Minutes First.');
                    END;*/

                    if rec5."In Financial?" = true then begin
                        Error('The Quotation is already in Financial stage. Please Find it in the next stage.');
                    end;
                    //ERROR('%1',"Ref No.");
                    Rec.SetFilter("Passes Technical?", '%1', true);
                    if Rec.FindSet then begin
                        Message('Financial Evaluation can begin in a separate Menu..');
                        rec5.Reset;
                        rec5.Get(Rec."Ref No.");
                        rec5."In Financial?" := true;
                        rec5."Technical in Progress?" := true;
                        rec5."Technical started?" := true;
                        rec5."Financial Started?" := true;
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
                            ProcurementLines.Reset;
                            ProcurementLines.SetRange(No, ProcurementLines.No);
                            if ProcurementLines.FindSet then
                                Rec."in Technical?" := true;
                            ProcurementLines."Technical in Progress?" := true;
                            Rec.Modify(true);
                        end;
                        //====================================================
                        CurrPage.Close;
                    end;
                    if not Rec.FindSet then begin
                        Error('No Supplier has passed Technical Specification...!!!');
                    end;

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Attach Technical Documents_Promoted"; "Attach Technical Documents")
                {
                }
                actionref("View Technical Documents_Promoted"; "View Technical Documents")
                {
                }
                actionref("Proceed to Financial_Promoted"; "Proceed to Financial")
                {
                }
            }
        }
    }

    var
        dialogbd: Dialog;
        ProcurementLines: Record "Procurement Request";
        TenderBids: Record "Tender Bids";
}

#pragma implicitwith restore


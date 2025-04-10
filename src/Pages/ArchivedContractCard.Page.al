page 52194313 "Archived Contract Card"
{
    PageType = Card;
    SourceTable = Contract;
    SourceTableView = WHERE (Status = CONST (Archived));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Contract No"; "Contract No")
                {
                }
                field("Contract Description"; "Contract Description")
                {
                }
                field("Contract Start Date"; "Contract Start Date")
                {
                }
                field("Contract Expiry Date"; "Contract Expiry Date")
                {
                }
                field("Service Provider"; "Service Provider")
                {
                }
                field("Service Provider Name"; "Service Provider Name")
                {
                }
                field("Service Provider Category"; "Service Provider Category")
                {
                }
                field("Client Vendor"; "Client Vendor")
                {
                }
                field("Client StakeHolder"; "Client StakeHolder")
                {
                }
                field("StakeHolder Name"; "StakeHolder Name")
                {
                }
                field(Property; Property)
                {
                }
                field("Property Name"; "Property Name")
                {
                }
                field("Contract Renewal Date"; "Contract Renewal Date")
                {
                }
                field(Type; Type)
                {
                }
                field("On Expiry Notice"; "On Expiry Notice")
                {
                }
                field("Three Months Notice"; "Three Months Notice")
                {
                }
                field("Mode of Payment"; "Mode of Payment")
                {
                }
                field("Payment Date"; "Payment Date")
                {
                }
                field("Payment Currency"; "Payment Currency")
                {
                }
                field("Performance Security %"; "Performance Security %")
                {
                }
                field("Performance Security Amount"; "Performance Security Amount")
                {
                }
                field("Contract Price Amt(Words)"; "Contract Price Amt(Words)")
                {
                }
                field("Performance Security(Words)"; "Performance Security(Words)")
                {
                }
                field("Contract Award Date"; "Contract Award Date")
                {
                }
                field("Contract Signing Date"; "Contract Signing Date")
                {
                }
                field(Status; Status)
                {
                }
            }
            part("Payment & Delivery Terms2"; "Payment & Delivery Terms2")
            {
                SubPageLink = "Contract Code"=FIELD("Contract No");
            }
            part("Contract Attendant Risks"; "Contract Attendant Risks")
            {
                SubPageLink = "Contract Code"=FIELD("Contract No");
            }
            part("CMA Contract Obligations"; "RBA Contract Obligations")
            {
                Caption = 'CMA Contract Obligations';
                SubPageLink = "Contract Code"=FIELD("Contract No");
            }
            part("CMA Contract Deliverables"; "RBA Contract Deliverables")
            {
                Caption = 'CMA Contract Deliverables';
                SubPageLink = "Contract Code"=FIELD("Contract No");
            }
            part("3rd Part Contract Deliverables"; "3rd Part Contract Deliverables")
            {
                SubPageLink = "Contract Code"=FIELD("Contract No");
            }
            part("Contract Fact Sheet Format"; "Contract Fact Sheet Format")
            {
                SubPageLink = "Contract Code"=FIELD("Contract No");
            }
            part("Contract Termination Proposals"; "Contract Termination Proposals")
            {
                SubPageLink = "Contract Code"=FIELD("Contract No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Related Documents")
            {
                Caption = 'Related Documents';
                action("Attached Documents")
                {
                    Caption = 'Attached Documents';
                    RunObject = Page "Contact Docs";
                    RunPageLink = Contracts = FIELD ("Contract No");
                }
                action("<Action1000000023>")
                {
                    Caption = 'Archive';

                    trigger OnAction()
                    begin
                        Archive();
                    end;
                }
            }
            group("&Attachment")
            {
                Caption = '&Attachment';
                Visible = true;
                action(Open)
                {
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record 5103;
                    begin
                        IF InteractTemplLanguage.GET("Contract No", "Language Code (Default)") THEN
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record 5103;
                    begin
                        IF NOT InteractTemplLanguage.GET("Contract No", "Language Code (Default)") THEN BEGIN
                            InteractTemplLanguage.INIT;
                            InteractTemplLanguage."Interaction Template Code" := "Contract No";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := "Contract Description";
                        END;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.UPDATE;
                        Attachment := Attachment::Yes;
                        MODIFY;
                    end;
                }
                action("Copy &from")
                {
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record 5103;
                    begin
                        IF NOT InteractTemplLanguage.GET("Contract No", "Language Code (Default)") THEN BEGIN
                            InteractTemplLanguage.INIT;
                            InteractTemplLanguage."Interaction Template Code" := "Contract No";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := "Contract Description";
                            InteractTemplLanguage.INSERT;
                            COMMIT;
                        END;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.UPDATE;
                        Attachment := Attachment::Yes;
                        MODIFY;
                    end;
                }
                action(Import)
                {
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record 5103;
                    begin
                        IF NOT InteractTemplLanguage.GET("Contract No", "Language Code (Default)") THEN BEGIN
                            InteractTemplLanguage.INIT;
                            InteractTemplLanguage."Interaction Template Code" := "Contract No";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            InteractTemplLanguage.Description := "Contract Description";
                            InteractTemplLanguage.INSERT;
                        END;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.UPDATE;
                        Attachment := Attachment::Yes;
                        MODIFY;
                    end;
                }
                action("E&xport")
                {
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record 5103;
                    begin
                        IF InteractTemplLanguage.GET("Contract No", "Language Code (Default)") THEN
                            InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record 5103;
                    begin
                        IF InteractTemplLanguage.GET("Contract No", "Language Code (Default)") THEN BEGIN
                            InteractTemplLanguage.RemoveAttachment(TRUE);
                            Attachment := Attachment::No;
                            MODIFY;
                        END;
                    end;
                }
            }
        }
    }

    var
        InteractTemplLanguage: Record 5103;
        Vend: Record 23;
        Cust: Record 18;
        FA: Record 5600;
        Contact: Record 5050;
        ApprovalMgt: Codeunit 439;
        Trash: Record 52193472;

  
    procedure Archive()
    begin

        //IF Rec.Status=Rec.Status::Open THEN
        //BEGIN
        Trash.RESET;
        //Trash.SETRANGE(Trash."Contract No", "Contract No");
        Rec.Status := Rec.Status::Archived;
        MODIFY;
        MESSAGE('The Contract has been Archived');
        //END;
    end;
}


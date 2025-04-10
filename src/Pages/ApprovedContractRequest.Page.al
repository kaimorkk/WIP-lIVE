page 52194299 "Approved Contract Request"
{
    PageType = Card;
    SourceTable = Contract;
    SourceTableView = WHERE (Status = CONST (Released));

    layout
    {
        area(content)
        {
            group(Contract)
            {
                field("Contract No"; "Contract No")
                {
                }
                field("Contract Name"; "Contract Description")
                {
                    Caption = 'Contract Name';
                }
                field("Agreement Type"; "Agreement Type")
                {
                }
                field(Type; Type)
                {
                }
                field("Client StakeHolder"; "Client StakeHolder")
                {
                }
                field("StakeHolder Name"; "StakeHolder Name")
                {
                }
                field("Tender No"; "Tender No")
                {
                }
                field("Contract Award Date"; "Contract Award Date")
                {
                }
                field("Contract Signing Date"; "Contract Signing Date")
                {
                }
                field("Contract Start Date"; "Contract Start Date")
                {
                }
                field(Amount; Amount)
                {
                }
                field("Contract Price Amt(Words)"; "Contract Price Amt(Words)")
                {
                }
                field("Three Months Notice"; "Three Months Notice")
                {
                }
                field("Six Months Notice"; "Six Months Notice")
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
                field("Performance Security(Words)"; "Performance Security(Words)")
                {
                }
                field("Performance Security Amount"; "Performance Security Amount")
                {
                }
                field("Performance Security Exp Date"; "Performance Security Exp Date")
                {
                }
                field(Performance; Performance)
                {
                }
                field(Status; Status)
                {
                }
                field("Contract Status"; "Contract Status")
                {
                }
            }
            part("Contract Intake CheckList"; "Contract Intake CheckList")
            {
                SubPageLink = "Contract Code"=FIELD("Contract No");
                    Visible = true;
            }
            part("Contract Fact Sheet"; "Contract Fact Sheet")
            {
                Caption = 'Contract Fact Sheet';
                SubPageLink = "Contract Code"=FIELD("Contract No");
                    Visible = true;
            }
            group("Contract Review")
            {
                Caption = 'Contract Review';
                part("Risk Assessment and Issues"; "Contract Attendant Risks")
                {
                    Caption = 'Risk Assessment and Issues';
                    SubPageLink = "Contract Code"=FIELD("Contract No");
                }
                part("ROI Summary"; "RBA Contract Obligations")
                {
                    Caption = 'ROI Summary';
                    SubPageLink = "Contract Code"=FIELD("Contract No");
                }
                part("Key Benefits"; "RBA Contract Deliverables")
                {
                    Caption = 'Key Benefits';
                    SubPageLink = "Contract Code"=FIELD("Contract No");
                }
                part("Key Negotiated Issues"; "3rd Part Contract Deliverables")
                {
                    Caption = 'Key Negotiated Issues';
                    SubPageLink = "Contract Code"=FIELD("Contract No");
                }
                part("Current Status"; "Contract Performance")
                {
                    Caption = 'Current Status';
                    SubPageLink = "Contract No"=FIELD("Contract No");
                }
                part("Contract Time Lines"; "Contract Time Lines")
                {
                    SubPageLink = "Contract No."=FIELD("Contract No");
                }
                part("Payment & Delivery Terms2"; "Payment & Delivery Terms2")
                {
                    SubPageLink = "Contract Code"=FIELD("Contract No");
                        Visible = false;
                }
                part("Contract Termination Proposals"; "Contract Termination Proposals")
                {
                    SubPageLink = "Contract Code"=FIELD("Contract No");
                        Visible = false;
                }
            }
            group("Contract Finalization")
            {
                Caption = 'Contract Finalization';
                field("Contract Expiry Date"; "Contract Expiry Date")
                {
                }
                field("Contract Renewal Date"; "Contract Renewal Date")
                {
                }
                field("On Expiry Notice"; "On Expiry Notice")
                {
                }
                field("Contract Renewal Clause"; "Contract Renewal Clause")
                {
                }
            }
        }
       
    }

    actions
    {
        area(navigation)
        {
            group("Request for Contract")
            {
                Caption = 'Request for Contract';
                action("<Action1000000041>")
                {
                    Caption = 'Send Approval Request';

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.SendContractApprovalRequest(Rec) THEN;
                    end;
                }
                action("<Action1000000042>")
                {
                    Caption = 'Cancel Approval Request';

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.CancelContractlApprovalRequest(Rec, TRUE, TRUE) THEN;
                    end;
                }
            }
            group("&Attachments")
            {
                Caption = '&Attachments';
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
                action("Attached Documents")
                {
                    Caption = 'Attached Documents';
                    RunObject = Page "Contact Docs";
                    RunPageLink = Contracts = FIELD ("Contract No");
                }
            }
            group("<Action1000000049>")
            {
                Caption = 'Functions';
                action("<Action1000000050>")
                {
                    Caption = 'Renew Contract';
                    Visible = false;

                    trigger OnAction()
                    begin
                        RenewContract;
                    end;
                }
                action("<Action1000000051>")
                {
                    Caption = 'Terminate Contract';
                    Visible = false;

                    trigger OnAction()
                    begin
                        TerminateContract;
                    end;
                }
                action("<Action1000000052>")
                {
                    Caption = 'Convert Into Contract';

                    trigger OnAction()
                    begin
                        ConvertIntoContract;
                    end;
                }
                action("<Action1000000023>")
                {
                    Caption = 'Archive';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //   Archive();
                    end;
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
}


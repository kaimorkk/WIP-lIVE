Page 52194135 "Fleet Card"
{
    PageType = Card;
    SourceTable = "Fixed Asset";
    SourceTableView = where("FA Class Code"=const('MV'),
                            Disposed=const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                label(Control1000000042)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19004684;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(OperationalNo;"Registration No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Operational No';
                }
                field(ParastatalRegNo;"Parastatl Reg. No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Parastatal Reg. No';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Make';
                }
                field(CarRating;"Car Rating")
                {
                    ApplicationArea = Basic;
                }
                field(YOM;YOM)
                {
                    ApplicationArea = Basic;
                }
                field(Duty;Duty)
                {
                    ApplicationArea = Basic;
                }
                field(Disposed;Disposed)
                {
                    ApplicationArea = Basic;
                }
                field(CarTrackingCompany;"Car Tracking Company")
                {
                    ApplicationArea = Basic;
                }
                field(TrackingDate;"Tracking Date")
                {
                    ApplicationArea = Basic;
                }
                field(TrackingRenewaldate;"Tracking Renewal date")
                {
                    ApplicationArea = Basic;
                }
                field(ChassisEngineNo;"Log Book No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Chassis/Engine No.';
                }
                field(Make;Make)
                {
                    ApplicationArea = Basic;
                }
                field(Body;Body)
                {
                    ApplicationArea = Basic;
                }
                field(RegDate;"Acq. date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reg. Date';
                }
                field(Model;Model)
                {
                    ApplicationArea = Basic;
                }
                field(Passengers;"Max. Carrying Capacity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Passengers';
                }
                field(Attachement;Attachement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Log book Attachment';
                    Editable = false;
                }
            }
            group(AdditionalInformation)
            {
                Caption = 'Additional Information';
                field(PolicyNo;"Policy No")
                {
                    ApplicationArea = Basic;
                }
                field(Insurer;Insurer)
                {
                    ApplicationArea = Basic;
                }
                field(InsuranceCompany;"Insurance Company")
                {
                    ApplicationArea = Basic;
                }
                field(PremiumAmount;"Premium Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Valuer;Valuer)
                {
                    ApplicationArea = Basic;
                }
                field(ValuationFirm;"Valuation Firm")
                {
                    ApplicationArea = Basic;
                }
                field(LastValuedDate;"Last Valued Date")
                {
                    ApplicationArea = Basic;
                }
                field(DateofCommencement;"Date of Commencement")
                {
                    ApplicationArea = Basic;
                }
                field(ExpiryDate;"Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field(DateofPurchase;"Date of Purchase")
                {
                    ApplicationArea = Basic;
                }
                field(AmountofPurchase;"Amount of Purchase")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(AttachLogBook)
            {
                Caption = 'Attach Log Book';
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.","Language Code (Default)") then
                          InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.","Language Code (Default)") then begin
                          InteractTemplLanguage.Init;
                          InteractTemplLanguage."Interaction Template Code" := "No.";
                          InteractTemplLanguage."Language Code" := "Language Code (Default)";
                          InteractTemplLanguage.Description := Description;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Attachement:=Attachement::Yes;
                        Modify;
                    end;
                }
                action(Copyfrom)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.","Language Code (Default)") then begin
                          InteractTemplLanguage.Init;
                          InteractTemplLanguage."Interaction Template Code" :="No.";
                          InteractTemplLanguage."Language Code" := "Language Code (Default)";
                          InteractTemplLanguage.Description := Description;
                          InteractTemplLanguage.Insert;
                          Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Attachement:=Attachement::Yes;
                        Modify;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.","Language Code (Default)") then begin
                          InteractTemplLanguage.Init;
                          InteractTemplLanguage."Interaction Template Code" := "No.";
                          InteractTemplLanguage."Language Code" := "Language Code (Default)";
                          InteractTemplLanguage.Description := Description;
                          InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Attachement:=Attachement::Yes;
                        Modify;
                    end;
                }
                action(Export)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.","Language Code (Default)") then
                          InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.","Language Code (Default)") then begin
                          InteractTemplLanguage.RemoveAttachment(true);
                          Attachement:=Attachement::No;
                          Modify;
                        end;
                    end;
                }
            }
            group(Vehicle)
            {
                Caption = 'Vehicle';
                action(Picture)
                {
                    ApplicationArea = Basic;
                    Caption = 'Picture';
                    Image = Picture;
                    RunObject = Page "Fixed Asset Picture";
                    RunPageLink = "No."=field("No.");
                }
                action(FuelCards)
                {
                    ApplicationArea = Basic;
                    Caption = 'Fuel Cards';
                    RunObject = Page "Fuel Cards";
                    RunPageLink = Vehicle=field("No.");
                }
            }
        }
        area(processing)
        {
            action(Comment)
            {
                ApplicationArea = Basic;
                Caption = 'Comment';
                RunObject = Page "Comment Sheet";
                RunPageLink = "Table Name"=const("Fixed Asset"),
                              "No."=field("No.");
                ToolTip = 'Comment';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Comment_Promoted; Comment)
                {
                }
            }
        }
    }

    var
        Text19004684: label 'Car Tracking Information';
}


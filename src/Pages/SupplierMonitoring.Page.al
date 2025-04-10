Page 52193911 "Supplier Monitoring"
{
    PageType = Card;
    SourceTable = "Supplier Monitoring1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(PurchaseOrderNo;"Purchase Order No.")
                {
                    ApplicationArea = Basic;
                }
                field(VendorName;"Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field(BriefDescriptionofWorkdone;"Brief Description of Work done")
                {
                    ApplicationArea = Basic;
                }
                field(AgreedStartDate;"Agreed Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ActualStartDate;"Actual Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(AgreedCompletiondate;"Agreed Completion date")
                {
                    ApplicationArea = Basic;
                }
                field(ActualCompletionDate;"Actual Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field(CompletedWithinSchedule;"Completed Within Schedule")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonsforLatecompletion;"Reasons for Late completion")
                {
                    ApplicationArea = Basic;
                }
                field(QualityofWork;"Quality of Work")
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
            group(Agenda)
            {
                Caption = 'Attachments';
                action("<Action1000000013>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        //IF InteractTemplLanguage.GET("Purchase Order No.","Language Code(Default)") THEN
                        //  InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action("<Action1000000014>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        /*IF NOT InteractTemplLanguage.GET("Purchase Order No.","Language Code(Default)") THEN BEGIN
                          InteractTemplLanguage.INIT;
                          InteractTemplLanguage."Interaction Template Code" := "Purchase Order No.";
                          InteractTemplLanguage."Language Code" := "Language Code(Default)";
                          InteractTemplLanguage.Description := "Brief Description of Work done";
                        END;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.UPDATE;
                        Attachment:=Attachment::"1";
                        MODIFY;*/

                    end;
                }
                action("<Action1000000015>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        /*IF NOT InteractTemplLanguage.GET("Purchase Order No.","Language Code(Default)") THEN BEGIN
                          InteractTemplLanguage.INIT;
                          InteractTemplLanguage."Interaction Template Code" :="Purchase Order No.";
                          InteractTemplLanguage."Language Code" := "Language Code(Default)";
                          InteractTemplLanguage.Description := "Brief Description of Work done";
                          InteractTemplLanguage.INSERT;
                          COMMIT;
                        END;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.UPDATE;
                        Attachment:=Attachment::"1";
                        MODIFY;*/

                    end;
                }
                action("<Action1000000016>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        /*IF NOT InteractTemplLanguage.GET("Purchase Order No.","Language Code(Default)") THEN BEGIN
                          InteractTemplLanguage.INIT;
                          InteractTemplLanguage."Interaction Template Code" := "Purchase Order No.";
                          InteractTemplLanguage."Language Code" := "Language Code(Default)";
                          InteractTemplLanguage.Description := "Brief Description of Work done";
                          InteractTemplLanguage.INSERT;
                        END;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.UPDATE;
                        Attachment:=Attachment::"1";
                        MODIFY;*/

                    end;
                }
                action("<Action1000000017>")
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        /*IF InteractTemplLanguage.GET("Purchase Order No.","Language Code(Default)") THEN
                          InteractTemplLanguage.ExportAttachment;
                         */

                    end;
                }
                action("<Action1000000018>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        /*IF InteractTemplLanguage.GET("Purchase Order No.","Language Code(Default)") THEN BEGIN
                          InteractTemplLanguage.RemoveAttachment(TRUE);
                          Attachment:=Attachment::"0";
                          MODIFY;
                        END;
                        */

                    end;
                }
            }
        }
    }
}


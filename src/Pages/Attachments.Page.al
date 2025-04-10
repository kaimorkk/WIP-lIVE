Page 52193654 Attachments
{
    AutoSplitKey = true;
    Caption = 'Attachments';
    PageType = List;
    SourceTable = "Member App Attachment Lines";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Descriptions;Descriptions)
                {
                    ApplicationArea = Basic;
                }
                field(Control1000000005;Attachment)
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
            group(Attachment)
            {
                Caption = 'Attachment';
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    Image = OpenWorksheet;
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Interaction Template Code",No);
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Language Code",Format("Line No"));

                        if InteractTemplLanguage.Find('-') then
                          InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;
                    Image = Attach;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        //IF NOT InteractTemplLanguage.GET(No,"Line No",'') THEN BEGIN
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Interaction Template Code",No);
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Language Code",Format("Line No"));

                        if not InteractTemplLanguage.Find('-') then begin

                          InteractTemplLanguage.Init;
                          InteractTemplLanguage."Interaction Template Code" := '';
                          InteractTemplLanguage."Language Code" := Descriptions;
                          InteractTemplLanguage.Description := No+''+Descriptions;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Attachment:=true;
                        Modify;
                    end;
                }
                action(Copyfrom)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;
                    Image = Copy;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        //IF NOT InteractTemplLanguage.GET(No,"Line No",'') THEN BEGIN
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Interaction Template Code",No);
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Language Code",Format("Line No"));

                        if not InteractTemplLanguage.Find('-') then begin

                          InteractTemplLanguage.Init;
                          InteractTemplLanguage."Interaction Template Code" :=No;
                          InteractTemplLanguage."Language Code" := Descriptions;
                          InteractTemplLanguage.Description := No+''+Descriptions;
                          InteractTemplLanguage.Insert;
                          Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Attachment:=true;
                        Modify;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;
                    Image = Import;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        //IF NOT InteractTemplLanguage.GET(No,"Line No") THEN BEGIN
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Interaction Template Code",No);
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Language Code",Format("Line No"));

                        if not InteractTemplLanguage.Find('-') then   begin

                          InteractTemplLanguage.Init;
                          InteractTemplLanguage."Interaction Template Code" :=No;
                          InteractTemplLanguage."Language Code" :=Format("Line No");
                          InteractTemplLanguage.Description := No+''+Descriptions;
                          InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Attachment:=true;
                        Modify;
                    end;
                }
                action(Export)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;
                    Image = ExportAttachment;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        //IF InteractTemplLanguage.GET(No,"Line No",'') THEN
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Interaction Template Code",No);
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Language Code",Format("Line No"));
                        if InteractTemplLanguage.Find('-') then
                          InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;
                    Image = CancelAttachment;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        //IF InteractTemplLanguage.GET(No,"Line No") THEN BEGIN
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Interaction Template Code",No);
                        InteractTemplLanguage.SetRange(InteractTemplLanguage."Language Code",Format("Line No"));

                        if InteractTemplLanguage.Find('-') then begin

                          InteractTemplLanguage.RemoveAttachment(true);
                          Attachment:=false;
                          Modify;
                        end;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Create_Promoted; Create)
                {
                }
                actionref(Copyfrom_Promoted; Copyfrom)
                {
                }
            }
            group(Category_Process)
            {
                actionref(Open_Promoted; Open)
                {
                }
                actionref(Import_Promoted; Import)
                {
                }
                actionref(Export_Promoted; Export)
                {
                }
                actionref(Remove_Promoted; Remove)
                {
                }
            }
        }
    }
}


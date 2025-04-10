Page 52194076 "Employee Linked Docs"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = Employee;
    SourceTableView = where(Status=const(Active));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Initials;Initials)
                {
                    ApplicationArea = Basic;
                }
                field(IDNumber;"ID Number")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                }
                field(ContractType;"Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfJoin;"Date Of Join")
                {
                    ApplicationArea = Basic;
                }
            }
            label(Control1000000030)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19034836;
                Style = Strong;
                StyleExpr = true;
            }
            part(DocLink;"Document Link")
            {
                SubPageLink = "Employee No"=field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Attachment)
            {
                Caption = '&Attachment';
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get("No.",CurrPage.DocLink.Page.GetDocument) then
                        begin
                        if InteractTemplLanguage.Get(CurrPage.DocLink.Page.GetDocument,DocLink."Language Code (Default)") then
                          InteractTemplLanguage.OpenAttachment;
                        end;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get("No.",CurrPage.DocLink.Page.GetDocument) then
                        begin
                        if not InteractTemplLanguage.Get(CurrPage.DocLink.Page.GetDocument,DocLink."Language Code (Default)") then begin
                          InteractTemplLanguage.Init;
                          InteractTemplLanguage."Interaction Template Code" := CurrPage.DocLink.Page.GetDocument;
                          InteractTemplLanguage."Language Code" := DocLink."Language Code (Default)";
                          InteractTemplLanguage.Description := CurrPage.DocLink.Page.GetDocument;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        DocLink.Attachement:=DocLink.Attachement::Yes;
                        DocLink.Modify;
                        end;
                    end;
                }
                action(Copyfrom)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get("No.",CurrPage.DocLink.Page.GetDocument) then
                        begin
                        if not InteractTemplLanguage.Get(DocLink."Document Description",DocLink."Language Code (Default)") then begin
                          InteractTemplLanguage.Init;
                          InteractTemplLanguage."Interaction Template Code" := DocLink."Document Description";
                          InteractTemplLanguage."Language Code" := DocLink."Language Code (Default)";
                          InteractTemplLanguage.Description := DocLink."Document Description";
                          InteractTemplLanguage.Insert;
                          Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        DocLink.Attachement:=DocLink.Attachement::Yes;
                        DocLink.Modify;
                        end;
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
                        if DocLink.Get("No.",CurrPage.DocLink.Page.GetDocument) then
                        begin
                        if not InteractTemplLanguage.Get(DocLink."Document Description",DocLink."Language Code (Default)") then begin
                          InteractTemplLanguage.Init;
                          InteractTemplLanguage."Interaction Template Code" :=DocLink."Document Description";
                          InteractTemplLanguage."Language Code" := DocLink."Language Code (Default)";
                          InteractTemplLanguage.Description := DocLink."Document Description";
                          InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        DocLink.Attachement:=DocLink.Attachement::Yes;
                        DocLink.Modify;
                        end;
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
                        if DocLink.Get("No.",CurrPage.DocLink.Page.GetDocument) then
                        begin
                        if InteractTemplLanguage.Get(DocLink."Document Description",DocLink."Language Code (Default)") then
                          InteractTemplLanguage.ExportAttachment;
                        end;
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
                        if DocLink.Get("No.",CurrPage.DocLink.Page.GetDocument) then
                        begin
                        if InteractTemplLanguage.Get(DocLink."Document Description",DocLink."Language Code (Default)") then begin
                          InteractTemplLanguage.RemoveAttachment(true);
                          DocLink.Attachement:=DocLink.Attachement::No;
                          DocLink.Modify;
                        end;
                        end;
                    end;
                }
            }
        }
    }

    var
        InteractTemplLanguage: Record "Interaction Tmpl. Language";
        DocLink: Record "Document Link1";
        Text19034836: label 'Employee Linked Documents';
}


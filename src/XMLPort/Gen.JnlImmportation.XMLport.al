XmlPort 50001 "Gen. Jnl Immportation"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("Gen. Journal Line"; "Gen. Journal Line")
            {
                XmlName = 'GenJnLine';
                fieldelement(TemplateName; "Gen. Journal Line"."Journal Template Name")
                {
                }
                fieldelement(BatchName; "Gen. Journal Line"."Journal Batch Name")
                {
                }
                fieldelement(LineNo; "Gen. Journal Line"."Line No.")
                {
                }
                fieldelement(PostingDate; "Gen. Journal Line"."Posting Date")
                {
                }
                fieldelement(DocumentNo; "Gen. Journal Line"."Document No.")
                {
                }
                fieldelement(AccountType; "Gen. Journal Line"."Account Type")
                {
                }
                fieldelement(AccountNo; "Gen. Journal Line"."Posting Date")
                {
                }
                fieldelement(Description; "Gen. Journal Line".Description)
                {
                }
                fieldelement(Amount; "Gen. Journal Line".Amount)
                {
                }
                fieldelement(Dimension1; "Gen. Journal Line"."Shortcut Dimension 1 Code")
                {
                }
                fieldelement(Dimension2; "Gen. Journal Line"."Shortcut Dimension 2 Code")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}


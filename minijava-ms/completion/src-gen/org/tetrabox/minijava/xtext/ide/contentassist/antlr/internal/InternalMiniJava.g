grammar InternalMiniJava;

options {
	superClass=AbstractInternalContentAssistParser;
	backtrack=true;
}

@lexer::header {
package org.tetrabox.minijava.xtext.ide.contentassist.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.ide.editor.contentassist.antlr.internal.Lexer;
}

@parser::header {
package org.tetrabox.minijava.xtext.ide.contentassist.antlr.internal;

import java.io.InputStream;
import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.ide.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;
import org.eclipse.xtext.ide.editor.contentassist.antlr.internal.DFA;
import org.tetrabox.minijava.xtext.services.MiniJavaGrammarAccess;

}
@parser::members {
	private MiniJavaGrammarAccess grammarAccess;

	public void setGrammarAccess(MiniJavaGrammarAccess grammarAccess) {
		this.grammarAccess = grammarAccess;
	}

	@Override
	protected Grammar getGrammar() {
		return grammarAccess.getGrammar();
	}

	@Override
	protected String getValueForTokenName(String tokenName) {
		return tokenName;
	}
}

// Entry rule entryRuleProgram
entryRuleProgram
:
{ before(grammarAccess.getProgramRule()); }
	 ruleProgram
{ after(grammarAccess.getProgramRule()); } 
	 EOF 
;

// Rule Program
ruleProgram 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getProgramAccess().getGroup()); }
		(rule__Program__Group__0)
		{ after(grammarAccess.getProgramAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleImport
entryRuleImport
:
{ before(grammarAccess.getImportRule()); }
	 ruleImport
{ after(grammarAccess.getImportRule()); } 
	 EOF 
;

// Rule Import
ruleImport 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getImportAccess().getGroup()); }
		(rule__Import__Group__0)
		{ after(grammarAccess.getImportAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleQualifiedName
entryRuleQualifiedName
:
{ before(grammarAccess.getQualifiedNameRule()); }
	 ruleQualifiedName
{ after(grammarAccess.getQualifiedNameRule()); } 
	 EOF 
;

// Rule QualifiedName
ruleQualifiedName 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getQualifiedNameAccess().getGroup()); }
		(rule__QualifiedName__Group__0)
		{ after(grammarAccess.getQualifiedNameAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleQualifiedNameWithWildcard
entryRuleQualifiedNameWithWildcard
:
{ before(grammarAccess.getQualifiedNameWithWildcardRule()); }
	 ruleQualifiedNameWithWildcard
{ after(grammarAccess.getQualifiedNameWithWildcardRule()); } 
	 EOF 
;

// Rule QualifiedNameWithWildcard
ruleQualifiedNameWithWildcard 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getQualifiedNameWithWildcardAccess().getGroup()); }
		(rule__QualifiedNameWithWildcard__Group__0)
		{ after(grammarAccess.getQualifiedNameWithWildcardAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleTypeDeclaration
entryRuleTypeDeclaration
:
{ before(grammarAccess.getTypeDeclarationRule()); }
	 ruleTypeDeclaration
{ after(grammarAccess.getTypeDeclarationRule()); } 
	 EOF 
;

// Rule TypeDeclaration
ruleTypeDeclaration 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getTypeDeclarationAccess().getAlternatives()); }
		(rule__TypeDeclaration__Alternatives)
		{ after(grammarAccess.getTypeDeclarationAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleClass
entryRuleClass
:
{ before(grammarAccess.getClassRule()); }
	 ruleClass
{ after(grammarAccess.getClassRule()); } 
	 EOF 
;

// Rule Class
ruleClass 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getClassAccess().getGroup()); }
		(rule__Class__Group__0)
		{ after(grammarAccess.getClassAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleInterface
entryRuleInterface
:
{ before(grammarAccess.getInterfaceRule()); }
	 ruleInterface
{ after(grammarAccess.getInterfaceRule()); } 
	 EOF 
;

// Rule Interface
ruleInterface 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getInterfaceAccess().getGroup()); }
		(rule__Interface__Group__0)
		{ after(grammarAccess.getInterfaceAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleMember
entryRuleMember
:
{ before(grammarAccess.getMemberRule()); }
	 ruleMember
{ after(grammarAccess.getMemberRule()); } 
	 EOF 
;

// Rule Member
ruleMember 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getMemberAccess().getAlternatives()); }
		(rule__Member__Alternatives)
		{ after(grammarAccess.getMemberAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleMethod
entryRuleMethod
:
{ before(grammarAccess.getMethodRule()); }
	 ruleMethod
{ after(grammarAccess.getMethodRule()); } 
	 EOF 
;

// Rule Method
ruleMethod 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getMethodAccess().getGroup()); }
		(rule__Method__Group__0)
		{ after(grammarAccess.getMethodAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleParameter
entryRuleParameter
:
{ before(grammarAccess.getParameterRule()); }
	 ruleParameter
{ after(grammarAccess.getParameterRule()); } 
	 EOF 
;

// Rule Parameter
ruleParameter 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getParameterAccess().getGroup()); }
		(rule__Parameter__Group__0)
		{ after(grammarAccess.getParameterAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleField
entryRuleField
:
{ before(grammarAccess.getFieldRule()); }
	 ruleField
{ after(grammarAccess.getFieldRule()); } 
	 EOF 
;

// Rule Field
ruleField 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getFieldAccess().getGroup()); }
		(rule__Field__Group__0)
		{ after(grammarAccess.getFieldAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleBlock
entryRuleBlock
:
{ before(grammarAccess.getBlockRule()); }
	 ruleBlock
{ after(grammarAccess.getBlockRule()); } 
	 EOF 
;

// Rule Block
ruleBlock 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getBlockAccess().getGroup()); }
		(rule__Block__Group__0)
		{ after(grammarAccess.getBlockAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleStatement
entryRuleStatement
:
{ before(grammarAccess.getStatementRule()); }
	 ruleStatement
{ after(grammarAccess.getStatementRule()); } 
	 EOF 
;

// Rule Statement
ruleStatement 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getStatementAccess().getAlternatives()); }
		(rule__Statement__Alternatives)
		{ after(grammarAccess.getStatementAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRulePrintStatement
entryRulePrintStatement
:
{ before(grammarAccess.getPrintStatementRule()); }
	 rulePrintStatement
{ after(grammarAccess.getPrintStatementRule()); } 
	 EOF 
;

// Rule PrintStatement
rulePrintStatement 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getPrintStatementAccess().getGroup()); }
		(rule__PrintStatement__Group__0)
		{ after(grammarAccess.getPrintStatementAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleReturn
entryRuleReturn
:
{ before(grammarAccess.getReturnRule()); }
	 ruleReturn
{ after(grammarAccess.getReturnRule()); } 
	 EOF 
;

// Rule Return
ruleReturn 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getReturnAccess().getGroup()); }
		(rule__Return__Group__0)
		{ after(grammarAccess.getReturnAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleIfStatement
entryRuleIfStatement
:
{ before(grammarAccess.getIfStatementRule()); }
	 ruleIfStatement
{ after(grammarAccess.getIfStatementRule()); } 
	 EOF 
;

// Rule IfStatement
ruleIfStatement 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getIfStatementAccess().getGroup()); }
		(rule__IfStatement__Group__0)
		{ after(grammarAccess.getIfStatementAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleWhileStatement
entryRuleWhileStatement
:
{ before(grammarAccess.getWhileStatementRule()); }
	 ruleWhileStatement
{ after(grammarAccess.getWhileStatementRule()); } 
	 EOF 
;

// Rule WhileStatement
ruleWhileStatement 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getWhileStatementAccess().getGroup()); }
		(rule__WhileStatement__Group__0)
		{ after(grammarAccess.getWhileStatementAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleForStatement
entryRuleForStatement
:
{ before(grammarAccess.getForStatementRule()); }
	 ruleForStatement
{ after(grammarAccess.getForStatementRule()); } 
	 EOF 
;

// Rule ForStatement
ruleForStatement 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getForStatementAccess().getGroup()); }
		(rule__ForStatement__Group__0)
		{ after(grammarAccess.getForStatementAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleTypeRef
entryRuleTypeRef
:
{ before(grammarAccess.getTypeRefRule()); }
	 ruleTypeRef
{ after(grammarAccess.getTypeRefRule()); } 
	 EOF 
;

// Rule TypeRef
ruleTypeRef 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getTypeRefAccess().getGroup()); }
		(rule__TypeRef__Group__0)
		{ after(grammarAccess.getTypeRefAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleSingleTypeRef
entryRuleSingleTypeRef
:
{ before(grammarAccess.getSingleTypeRefRule()); }
	 ruleSingleTypeRef
{ after(grammarAccess.getSingleTypeRefRule()); } 
	 EOF 
;

// Rule SingleTypeRef
ruleSingleTypeRef 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getSingleTypeRefAccess().getAlternatives()); }
		(rule__SingleTypeRef__Alternatives)
		{ after(grammarAccess.getSingleTypeRefAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleClassRef
entryRuleClassRef
:
{ before(grammarAccess.getClassRefRule()); }
	 ruleClassRef
{ after(grammarAccess.getClassRefRule()); } 
	 EOF 
;

// Rule ClassRef
ruleClassRef 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getClassRefAccess().getReferencedClassAssignment()); }
		(rule__ClassRef__ReferencedClassAssignment)
		{ after(grammarAccess.getClassRefAccess().getReferencedClassAssignment()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleTypedDeclaration
entryRuleTypedDeclaration
:
{ before(grammarAccess.getTypedDeclarationRule()); }
	 ruleTypedDeclaration
{ after(grammarAccess.getTypedDeclarationRule()); } 
	 EOF 
;

// Rule TypedDeclaration
ruleTypedDeclaration 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getTypedDeclarationAccess().getAlternatives()); }
		(rule__TypedDeclaration__Alternatives)
		{ after(grammarAccess.getTypedDeclarationAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleSymbol
entryRuleSymbol
:
{ before(grammarAccess.getSymbolRule()); }
	 ruleSymbol
{ after(grammarAccess.getSymbolRule()); } 
	 EOF 
;

// Rule Symbol
ruleSymbol 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getSymbolAccess().getAlternatives()); }
		(rule__Symbol__Alternatives)
		{ after(grammarAccess.getSymbolAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleVariableDeclaration
entryRuleVariableDeclaration
:
{ before(grammarAccess.getVariableDeclarationRule()); }
	 ruleVariableDeclaration
{ after(grammarAccess.getVariableDeclarationRule()); } 
	 EOF 
;

// Rule VariableDeclaration
ruleVariableDeclaration 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getVariableDeclarationAccess().getGroup()); }
		(rule__VariableDeclaration__Group__0)
		{ after(grammarAccess.getVariableDeclarationAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleAssignment
entryRuleAssignment
:
{ before(grammarAccess.getAssignmentRule()); }
	 ruleAssignment
{ after(grammarAccess.getAssignmentRule()); } 
	 EOF 
;

// Rule Assignment
ruleAssignment 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getAssignmentAccess().getGroup()); }
		(rule__Assignment__Group__0)
		{ after(grammarAccess.getAssignmentAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleAssignee
entryRuleAssignee
:
{ before(grammarAccess.getAssigneeRule()); }
	 ruleAssignee
{ after(grammarAccess.getAssigneeRule()); } 
	 EOF 
;

// Rule Assignee
ruleAssignee 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getAssigneeAccess().getAlternatives()); }
		(rule__Assignee__Alternatives)
		{ after(grammarAccess.getAssigneeAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleExpression
entryRuleExpression
:
{ before(grammarAccess.getExpressionRule()); }
	 ruleExpression
{ after(grammarAccess.getExpressionRule()); } 
	 EOF 
;

// Rule Expression
ruleExpression 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getExpressionAccess().getOrParserRuleCall()); }
		ruleOr
		{ after(grammarAccess.getExpressionAccess().getOrParserRuleCall()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleOr
entryRuleOr
:
{ before(grammarAccess.getOrRule()); }
	 ruleOr
{ after(grammarAccess.getOrRule()); } 
	 EOF 
;

// Rule Or
ruleOr 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getOrAccess().getGroup()); }
		(rule__Or__Group__0)
		{ after(grammarAccess.getOrAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleAnd
entryRuleAnd
:
{ before(grammarAccess.getAndRule()); }
	 ruleAnd
{ after(grammarAccess.getAndRule()); } 
	 EOF 
;

// Rule And
ruleAnd 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getAndAccess().getGroup()); }
		(rule__And__Group__0)
		{ after(grammarAccess.getAndAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleEquality
entryRuleEquality
:
{ before(grammarAccess.getEqualityRule()); }
	 ruleEquality
{ after(grammarAccess.getEqualityRule()); } 
	 EOF 
;

// Rule Equality
ruleEquality 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getEqualityAccess().getGroup()); }
		(rule__Equality__Group__0)
		{ after(grammarAccess.getEqualityAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleComparison
entryRuleComparison
:
{ before(grammarAccess.getComparisonRule()); }
	 ruleComparison
{ after(grammarAccess.getComparisonRule()); } 
	 EOF 
;

// Rule Comparison
ruleComparison 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getComparisonAccess().getGroup()); }
		(rule__Comparison__Group__0)
		{ after(grammarAccess.getComparisonAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRulePlusOrMinus
entryRulePlusOrMinus
:
{ before(grammarAccess.getPlusOrMinusRule()); }
	 rulePlusOrMinus
{ after(grammarAccess.getPlusOrMinusRule()); } 
	 EOF 
;

// Rule PlusOrMinus
rulePlusOrMinus 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getPlusOrMinusAccess().getGroup()); }
		(rule__PlusOrMinus__Group__0)
		{ after(grammarAccess.getPlusOrMinusAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleMulOrDiv
entryRuleMulOrDiv
:
{ before(grammarAccess.getMulOrDivRule()); }
	 ruleMulOrDiv
{ after(grammarAccess.getMulOrDivRule()); } 
	 EOF 
;

// Rule MulOrDiv
ruleMulOrDiv 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getMulOrDivAccess().getGroup()); }
		(rule__MulOrDiv__Group__0)
		{ after(grammarAccess.getMulOrDivAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleArrayAccess
entryRuleArrayAccess
:
{ before(grammarAccess.getArrayAccessRule()); }
	 ruleArrayAccess
{ after(grammarAccess.getArrayAccessRule()); } 
	 EOF 
;

// Rule ArrayAccess
ruleArrayAccess 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getArrayAccessAccess().getGroup()); }
		(rule__ArrayAccess__Group__0)
		{ after(grammarAccess.getArrayAccessAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleArrayLength
entryRuleArrayLength
:
{ before(grammarAccess.getArrayLengthRule()); }
	 ruleArrayLength
{ after(grammarAccess.getArrayLengthRule()); } 
	 EOF 
;

// Rule ArrayLength
ruleArrayLength 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getArrayLengthAccess().getGroup()); }
		(rule__ArrayLength__Group__0)
		{ after(grammarAccess.getArrayLengthAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRulePrimary
entryRulePrimary
:
{ before(grammarAccess.getPrimaryRule()); }
	 rulePrimary
{ after(grammarAccess.getPrimaryRule()); } 
	 EOF 
;

// Rule Primary
rulePrimary 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getPrimaryAccess().getAlternatives()); }
		(rule__Primary__Alternatives)
		{ after(grammarAccess.getPrimaryAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleSelectionExpression
entryRuleSelectionExpression
:
{ before(grammarAccess.getSelectionExpressionRule()); }
	 ruleSelectionExpression
{ after(grammarAccess.getSelectionExpressionRule()); } 
	 EOF 
;

// Rule SelectionExpression
ruleSelectionExpression 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getSelectionExpressionAccess().getGroup()); }
		(rule__SelectionExpression__Group__0)
		{ after(grammarAccess.getSelectionExpressionAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleTerminalExpression
entryRuleTerminalExpression
:
{ before(grammarAccess.getTerminalExpressionRule()); }
	 ruleTerminalExpression
{ after(grammarAccess.getTerminalExpressionRule()); } 
	 EOF 
;

// Rule TerminalExpression
ruleTerminalExpression 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getAlternatives()); }
		(rule__TerminalExpression__Alternatives)
		{ after(grammarAccess.getTerminalExpressionAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Rule AccessLevel
ruleAccessLevel
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getAccessLevelAccess().getAlternatives()); }
		(rule__AccessLevel__Alternatives)
		{ after(grammarAccess.getAccessLevelAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TypeDeclaration__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTypeDeclarationAccess().getClassParserRuleCall_0()); }
		ruleClass
		{ after(grammarAccess.getTypeDeclarationAccess().getClassParserRuleCall_0()); }
	)
	|
	(
		{ before(grammarAccess.getTypeDeclarationAccess().getInterfaceParserRuleCall_1()); }
		ruleInterface
		{ after(grammarAccess.getTypeDeclarationAccess().getInterfaceParserRuleCall_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Member__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMemberAccess().getFieldParserRuleCall_0()); }
		ruleField
		{ after(grammarAccess.getMemberAccess().getFieldParserRuleCall_0()); }
	)
	|
	(
		{ before(grammarAccess.getMemberAccess().getMethodParserRuleCall_1()); }
		ruleMethod
		{ after(grammarAccess.getMemberAccess().getMethodParserRuleCall_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Alternatives_8
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMethodAccess().getBodyAssignment_8_0()); }
		(rule__Method__BodyAssignment_8_0)
		{ after(grammarAccess.getMethodAccess().getBodyAssignment_8_0()); }
	)
	|
	(
		{ before(grammarAccess.getMethodAccess().getSemicolonKeyword_8_1()); }
		';'
		{ after(grammarAccess.getMethodAccess().getSemicolonKeyword_8_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getStatementAccess().getGroup_0()); }
		(rule__Statement__Group_0__0)
		{ after(grammarAccess.getStatementAccess().getGroup_0()); }
	)
	|
	(
		{ before(grammarAccess.getStatementAccess().getGroup_1()); }
		(rule__Statement__Group_1__0)
		{ after(grammarAccess.getStatementAccess().getGroup_1()); }
	)
	|
	(
		{ before(grammarAccess.getStatementAccess().getIfStatementParserRuleCall_2()); }
		ruleIfStatement
		{ after(grammarAccess.getStatementAccess().getIfStatementParserRuleCall_2()); }
	)
	|
	(
		{ before(grammarAccess.getStatementAccess().getWhileStatementParserRuleCall_3()); }
		ruleWhileStatement
		{ after(grammarAccess.getStatementAccess().getWhileStatementParserRuleCall_3()); }
	)
	|
	(
		{ before(grammarAccess.getStatementAccess().getForStatementParserRuleCall_4()); }
		ruleForStatement
		{ after(grammarAccess.getStatementAccess().getForStatementParserRuleCall_4()); }
	)
	|
	(
		{ before(grammarAccess.getStatementAccess().getGroup_5()); }
		(rule__Statement__Group_5__0)
		{ after(grammarAccess.getStatementAccess().getGroup_5()); }
	)
	|
	(
		{ before(grammarAccess.getStatementAccess().getBlockParserRuleCall_6()); }
		ruleBlock
		{ after(grammarAccess.getStatementAccess().getBlockParserRuleCall_6()); }
	)
	|
	(
		{ before(grammarAccess.getStatementAccess().getGroup_7()); }
		(rule__Statement__Group_7__0)
		{ after(grammarAccess.getStatementAccess().getGroup_7()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getSingleTypeRefAccess().getClassRefParserRuleCall_0()); }
		ruleClassRef
		{ after(grammarAccess.getSingleTypeRefAccess().getClassRefParserRuleCall_0()); }
	)
	|
	(
		{ before(grammarAccess.getSingleTypeRefAccess().getGroup_1()); }
		(rule__SingleTypeRef__Group_1__0)
		{ after(grammarAccess.getSingleTypeRefAccess().getGroup_1()); }
	)
	|
	(
		{ before(grammarAccess.getSingleTypeRefAccess().getGroup_2()); }
		(rule__SingleTypeRef__Group_2__0)
		{ after(grammarAccess.getSingleTypeRefAccess().getGroup_2()); }
	)
	|
	(
		{ before(grammarAccess.getSingleTypeRefAccess().getGroup_3()); }
		(rule__SingleTypeRef__Group_3__0)
		{ after(grammarAccess.getSingleTypeRefAccess().getGroup_3()); }
	)
	|
	(
		{ before(grammarAccess.getSingleTypeRefAccess().getGroup_4()); }
		(rule__SingleTypeRef__Group_4__0)
		{ after(grammarAccess.getSingleTypeRefAccess().getGroup_4()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TypedDeclaration__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTypedDeclarationAccess().getSymbolParserRuleCall_0()); }
		ruleSymbol
		{ after(grammarAccess.getTypedDeclarationAccess().getSymbolParserRuleCall_0()); }
	)
	|
	(
		{ before(grammarAccess.getTypedDeclarationAccess().getMemberParserRuleCall_1()); }
		ruleMember
		{ after(grammarAccess.getTypedDeclarationAccess().getMemberParserRuleCall_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Symbol__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getSymbolAccess().getParameterParserRuleCall_0()); }
		(ruleParameter)
		{ after(grammarAccess.getSymbolAccess().getParameterParserRuleCall_0()); }
	)
	|
	(
		{ before(grammarAccess.getSymbolAccess().getVariableDeclarationParserRuleCall_1()); }
		ruleVariableDeclaration
		{ after(grammarAccess.getSymbolAccess().getVariableDeclarationParserRuleCall_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Assignee__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getAssigneeAccess().getArrayAccessParserRuleCall_0()); }
		(ruleArrayAccess)
		{ after(grammarAccess.getAssigneeAccess().getArrayAccessParserRuleCall_0()); }
	)
	|
	(
		{ before(grammarAccess.getAssigneeAccess().getVariableDeclarationParserRuleCall_1()); }
		ruleVariableDeclaration
		{ after(grammarAccess.getAssigneeAccess().getVariableDeclarationParserRuleCall_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Alternatives_1_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getEqualityAccess().getGroup_1_0_0()); }
		(rule__Equality__Group_1_0_0__0)
		{ after(grammarAccess.getEqualityAccess().getGroup_1_0_0()); }
	)
	|
	(
		{ before(grammarAccess.getEqualityAccess().getGroup_1_0_1()); }
		(rule__Equality__Group_1_0_1__0)
		{ after(grammarAccess.getEqualityAccess().getGroup_1_0_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Alternatives_1_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getComparisonAccess().getGroup_1_0_0()); }
		(rule__Comparison__Group_1_0_0__0)
		{ after(grammarAccess.getComparisonAccess().getGroup_1_0_0()); }
	)
	|
	(
		{ before(grammarAccess.getComparisonAccess().getGroup_1_0_1()); }
		(rule__Comparison__Group_1_0_1__0)
		{ after(grammarAccess.getComparisonAccess().getGroup_1_0_1()); }
	)
	|
	(
		{ before(grammarAccess.getComparisonAccess().getGroup_1_0_2()); }
		(rule__Comparison__Group_1_0_2__0)
		{ after(grammarAccess.getComparisonAccess().getGroup_1_0_2()); }
	)
	|
	(
		{ before(grammarAccess.getComparisonAccess().getGroup_1_0_3()); }
		(rule__Comparison__Group_1_0_3__0)
		{ after(grammarAccess.getComparisonAccess().getGroup_1_0_3()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Alternatives_1_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getPlusOrMinusAccess().getGroup_1_0_0()); }
		(rule__PlusOrMinus__Group_1_0_0__0)
		{ after(grammarAccess.getPlusOrMinusAccess().getGroup_1_0_0()); }
	)
	|
	(
		{ before(grammarAccess.getPlusOrMinusAccess().getGroup_1_0_1()); }
		(rule__PlusOrMinus__Group_1_0_1__0)
		{ after(grammarAccess.getPlusOrMinusAccess().getGroup_1_0_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Alternatives_1_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMulOrDivAccess().getGroup_1_0_0()); }
		(rule__MulOrDiv__Group_1_0_0__0)
		{ after(grammarAccess.getMulOrDivAccess().getGroup_1_0_0()); }
	)
	|
	(
		{ before(grammarAccess.getMulOrDivAccess().getGroup_1_0_1()); }
		(rule__MulOrDiv__Group_1_0_1__0)
		{ after(grammarAccess.getMulOrDivAccess().getGroup_1_0_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getPrimaryAccess().getGroup_0()); }
		(rule__Primary__Group_0__0)
		{ after(grammarAccess.getPrimaryAccess().getGroup_0()); }
	)
	|
	(
		{ before(grammarAccess.getPrimaryAccess().getGroup_1()); }
		(rule__Primary__Group_1__0)
		{ after(grammarAccess.getPrimaryAccess().getGroup_1()); }
	)
	|
	(
		{ before(grammarAccess.getPrimaryAccess().getGroup_2()); }
		(rule__Primary__Group_2__0)
		{ after(grammarAccess.getPrimaryAccess().getGroup_2()); }
	)
	|
	(
		{ before(grammarAccess.getPrimaryAccess().getSelectionExpressionParserRuleCall_3()); }
		ruleSelectionExpression
		{ after(grammarAccess.getPrimaryAccess().getSelectionExpressionParserRuleCall_3()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Alternatives_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getSelectionExpressionAccess().getGroup_1_0()); }
		(rule__SelectionExpression__Group_1_0__0)
		{ after(grammarAccess.getSelectionExpressionAccess().getGroup_1_0()); }
	)
	|
	(
		{ before(grammarAccess.getSelectionExpressionAccess().getGroup_1_1()); }
		(rule__SelectionExpression__Group_1_1__0)
		{ after(grammarAccess.getSelectionExpressionAccess().getGroup_1_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getGroup_0()); }
		(rule__TerminalExpression__Group_0__0)
		{ after(grammarAccess.getTerminalExpressionAccess().getGroup_0()); }
	)
	|
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getGroup_1()); }
		(rule__TerminalExpression__Group_1__0)
		{ after(grammarAccess.getTerminalExpressionAccess().getGroup_1()); }
	)
	|
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getGroup_2()); }
		(rule__TerminalExpression__Group_2__0)
		{ after(grammarAccess.getTerminalExpressionAccess().getGroup_2()); }
	)
	|
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getGroup_3()); }
		(rule__TerminalExpression__Group_3__0)
		{ after(grammarAccess.getTerminalExpressionAccess().getGroup_3()); }
	)
	|
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getGroup_4()); }
		(rule__TerminalExpression__Group_4__0)
		{ after(grammarAccess.getTerminalExpressionAccess().getGroup_4()); }
	)
	|
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getGroup_5()); }
		(rule__TerminalExpression__Group_5__0)
		{ after(grammarAccess.getTerminalExpressionAccess().getGroup_5()); }
	)
	|
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getGroup_6()); }
		(rule__TerminalExpression__Group_6__0)
		{ after(grammarAccess.getTerminalExpressionAccess().getGroup_6()); }
	)
	|
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getGroup_7()); }
		(rule__TerminalExpression__Group_7__0)
		{ after(grammarAccess.getTerminalExpressionAccess().getGroup_7()); }
	)
	|
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getGroup_8()); }
		(rule__TerminalExpression__Group_8__0)
		{ after(grammarAccess.getTerminalExpressionAccess().getGroup_8()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__ValueAlternatives_2_1_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getValueTrueKeyword_2_1_0_0()); }
		'true'
		{ after(grammarAccess.getTerminalExpressionAccess().getValueTrueKeyword_2_1_0_0()); }
	)
	|
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getValueFalseKeyword_2_1_0_1()); }
		'false'
		{ after(grammarAccess.getTerminalExpressionAccess().getValueFalseKeyword_2_1_0_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__AccessLevel__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getAccessLevelAccess().getPRIVATEEnumLiteralDeclaration_0()); }
		('private')
		{ after(grammarAccess.getAccessLevelAccess().getPRIVATEEnumLiteralDeclaration_0()); }
	)
	|
	(
		{ before(grammarAccess.getAccessLevelAccess().getPROTECTEDEnumLiteralDeclaration_1()); }
		('protected')
		{ after(grammarAccess.getAccessLevelAccess().getPROTECTEDEnumLiteralDeclaration_1()); }
	)
	|
	(
		{ before(grammarAccess.getAccessLevelAccess().getPUBLICEnumLiteralDeclaration_2()); }
		('public')
		{ after(grammarAccess.getAccessLevelAccess().getPUBLICEnumLiteralDeclaration_2()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Program__Group__0__Impl
	rule__Program__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getProgramAccess().getGroup_0()); }
	(rule__Program__Group_0__0)?
	{ after(grammarAccess.getProgramAccess().getGroup_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Program__Group__1__Impl
	rule__Program__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getProgramAccess().getImportsAssignment_1()); }
	(rule__Program__ImportsAssignment_1)*
	{ after(grammarAccess.getProgramAccess().getImportsAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Program__Group__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getProgramAccess().getClassesAssignment_2()); }
	(rule__Program__ClassesAssignment_2)*
	{ after(grammarAccess.getProgramAccess().getClassesAssignment_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Program__Group_0__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Program__Group_0__0__Impl
	rule__Program__Group_0__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group_0__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getProgramAccess().getPackageKeyword_0_0()); }
	'package'
	{ after(grammarAccess.getProgramAccess().getPackageKeyword_0_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group_0__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Program__Group_0__1__Impl
	rule__Program__Group_0__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group_0__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getProgramAccess().getNameAssignment_0_1()); }
	(rule__Program__NameAssignment_0_1)
	{ after(grammarAccess.getProgramAccess().getNameAssignment_0_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group_0__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Program__Group_0__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__Group_0__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getProgramAccess().getSemicolonKeyword_0_2()); }
	';'
	{ after(grammarAccess.getProgramAccess().getSemicolonKeyword_0_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Import__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Import__Group__0__Impl
	rule__Import__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getImportAccess().getImportKeyword_0()); }
	'import'
	{ after(grammarAccess.getImportAccess().getImportKeyword_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Import__Group__1__Impl
	rule__Import__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getImportAccess().getImportedNamespaceAssignment_1()); }
	(rule__Import__ImportedNamespaceAssignment_1)
	{ after(grammarAccess.getImportAccess().getImportedNamespaceAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Import__Group__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getImportAccess().getSemicolonKeyword_2()); }
	';'
	{ after(grammarAccess.getImportAccess().getSemicolonKeyword_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__QualifiedName__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedName__Group__0__Impl
	rule__QualifiedName__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameAccess().getIDTerminalRuleCall_0()); }
	RULE_ID
	{ after(grammarAccess.getQualifiedNameAccess().getIDTerminalRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedName__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameAccess().getGroup_1()); }
	(rule__QualifiedName__Group_1__0)*
	{ after(grammarAccess.getQualifiedNameAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__QualifiedName__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedName__Group_1__0__Impl
	rule__QualifiedName__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameAccess().getFullStopKeyword_1_0()); }
	'.'
	{ after(grammarAccess.getQualifiedNameAccess().getFullStopKeyword_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedName__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameAccess().getIDTerminalRuleCall_1_1()); }
	RULE_ID
	{ after(grammarAccess.getQualifiedNameAccess().getIDTerminalRuleCall_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__QualifiedNameWithWildcard__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedNameWithWildcard__Group__0__Impl
	rule__QualifiedNameWithWildcard__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedNameWithWildcard__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameWithWildcardAccess().getQualifiedNameParserRuleCall_0()); }
	ruleQualifiedName
	{ after(grammarAccess.getQualifiedNameWithWildcardAccess().getQualifiedNameParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedNameWithWildcard__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedNameWithWildcard__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedNameWithWildcard__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameWithWildcardAccess().getFullStopAsteriskKeyword_1()); }
	('.*')?
	{ after(grammarAccess.getQualifiedNameWithWildcardAccess().getFullStopAsteriskKeyword_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Class__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group__0__Impl
	rule__Class__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getAccessLevelAssignment_0()); }
	(rule__Class__AccessLevelAssignment_0)?
	{ after(grammarAccess.getClassAccess().getAccessLevelAssignment_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group__1__Impl
	rule__Class__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getAbstractAssignment_1()); }
	(rule__Class__AbstractAssignment_1)?
	{ after(grammarAccess.getClassAccess().getAbstractAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group__2__Impl
	rule__Class__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getClassKeyword_2()); }
	'class'
	{ after(grammarAccess.getClassAccess().getClassKeyword_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group__3__Impl
	rule__Class__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getNameAssignment_3()); }
	(rule__Class__NameAssignment_3)
	{ after(grammarAccess.getClassAccess().getNameAssignment_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group__4__Impl
	rule__Class__Group__5
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getGroup_4()); }
	(rule__Class__Group_4__0)?
	{ after(grammarAccess.getClassAccess().getGroup_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__5
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group__5__Impl
	rule__Class__Group__6
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__5__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getGroup_5()); }
	(rule__Class__Group_5__0)?
	{ after(grammarAccess.getClassAccess().getGroup_5()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__6
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group__6__Impl
	rule__Class__Group__7
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__6__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getLeftCurlyBracketKeyword_6()); }
	'{'
	{ after(grammarAccess.getClassAccess().getLeftCurlyBracketKeyword_6()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__7
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group__7__Impl
	rule__Class__Group__8
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__7__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getMembersAssignment_7()); }
	(rule__Class__MembersAssignment_7)*
	{ after(grammarAccess.getClassAccess().getMembersAssignment_7()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__8
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group__8__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group__8__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getRightCurlyBracketKeyword_8()); }
	'}'
	{ after(grammarAccess.getClassAccess().getRightCurlyBracketKeyword_8()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Class__Group_4__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group_4__0__Impl
	rule__Class__Group_4__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_4__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getExtendsKeyword_4_0()); }
	'extends'
	{ after(grammarAccess.getClassAccess().getExtendsKeyword_4_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_4__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group_4__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_4__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getSuperClassAssignment_4_1()); }
	(rule__Class__SuperClassAssignment_4_1)
	{ after(grammarAccess.getClassAccess().getSuperClassAssignment_4_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Class__Group_5__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group_5__0__Impl
	rule__Class__Group_5__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_5__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getImplementsKeyword_5_0()); }
	'implements'
	{ after(grammarAccess.getClassAccess().getImplementsKeyword_5_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_5__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group_5__1__Impl
	rule__Class__Group_5__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_5__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getImplementsAssignment_5_1()); }
	(rule__Class__ImplementsAssignment_5_1)
	{ after(grammarAccess.getClassAccess().getImplementsAssignment_5_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_5__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group_5__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_5__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getGroup_5_2()); }
	(rule__Class__Group_5_2__0)*
	{ after(grammarAccess.getClassAccess().getGroup_5_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Class__Group_5_2__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group_5_2__0__Impl
	rule__Class__Group_5_2__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_5_2__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getCommaKeyword_5_2_0()); }
	','
	{ after(grammarAccess.getClassAccess().getCommaKeyword_5_2_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_5_2__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Class__Group_5_2__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__Group_5_2__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getClassAccess().getImplementsAssignment_5_2_1()); }
	(rule__Class__ImplementsAssignment_5_2_1)
	{ after(grammarAccess.getClassAccess().getImplementsAssignment_5_2_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Interface__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group__0__Impl
	rule__Interface__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getAccessLevelAssignment_0()); }
	(rule__Interface__AccessLevelAssignment_0)?
	{ after(grammarAccess.getInterfaceAccess().getAccessLevelAssignment_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group__1__Impl
	rule__Interface__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getInterfaceKeyword_1()); }
	'interface'
	{ after(grammarAccess.getInterfaceAccess().getInterfaceKeyword_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group__2__Impl
	rule__Interface__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getNameAssignment_2()); }
	(rule__Interface__NameAssignment_2)
	{ after(grammarAccess.getInterfaceAccess().getNameAssignment_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group__3__Impl
	rule__Interface__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getGroup_3()); }
	(rule__Interface__Group_3__0)?
	{ after(grammarAccess.getInterfaceAccess().getGroup_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group__4__Impl
	rule__Interface__Group__5
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getLeftCurlyBracketKeyword_4()); }
	'{'
	{ after(grammarAccess.getInterfaceAccess().getLeftCurlyBracketKeyword_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__5
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group__5__Impl
	rule__Interface__Group__6
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__5__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getMembersAssignment_5()); }
	(rule__Interface__MembersAssignment_5)*
	{ after(grammarAccess.getInterfaceAccess().getMembersAssignment_5()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__6
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group__6__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group__6__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getRightCurlyBracketKeyword_6()); }
	'}'
	{ after(grammarAccess.getInterfaceAccess().getRightCurlyBracketKeyword_6()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Interface__Group_3__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group_3__0__Impl
	rule__Interface__Group_3__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group_3__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getExtendsKeyword_3_0()); }
	'extends'
	{ after(grammarAccess.getInterfaceAccess().getExtendsKeyword_3_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group_3__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group_3__1__Impl
	rule__Interface__Group_3__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group_3__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getImplementsAssignment_3_1()); }
	(rule__Interface__ImplementsAssignment_3_1)
	{ after(grammarAccess.getInterfaceAccess().getImplementsAssignment_3_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group_3__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group_3__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group_3__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getGroup_3_2()); }
	(rule__Interface__Group_3_2__0)*
	{ after(grammarAccess.getInterfaceAccess().getGroup_3_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Interface__Group_3_2__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group_3_2__0__Impl
	rule__Interface__Group_3_2__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group_3_2__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getCommaKeyword_3_2_0()); }
	','
	{ after(grammarAccess.getInterfaceAccess().getCommaKeyword_3_2_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group_3_2__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Interface__Group_3_2__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__Group_3_2__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getInterfaceAccess().getImplementsAssignment_3_2_1()); }
	(rule__Interface__ImplementsAssignment_3_2_1)
	{ after(grammarAccess.getInterfaceAccess().getImplementsAssignment_3_2_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Method__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group__0__Impl
	rule__Method__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getAccessAssignment_0()); }
	(rule__Method__AccessAssignment_0)?
	{ after(grammarAccess.getMethodAccess().getAccessAssignment_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group__1__Impl
	rule__Method__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getAbstractAssignment_1()); }
	(rule__Method__AbstractAssignment_1)?
	{ after(grammarAccess.getMethodAccess().getAbstractAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group__2__Impl
	rule__Method__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getStaticAssignment_2()); }
	(rule__Method__StaticAssignment_2)?
	{ after(grammarAccess.getMethodAccess().getStaticAssignment_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group__3__Impl
	rule__Method__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getTypeRefAssignment_3()); }
	(rule__Method__TypeRefAssignment_3)
	{ after(grammarAccess.getMethodAccess().getTypeRefAssignment_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group__4__Impl
	rule__Method__Group__5
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getNameAssignment_4()); }
	(rule__Method__NameAssignment_4)?
	{ after(grammarAccess.getMethodAccess().getNameAssignment_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__5
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group__5__Impl
	rule__Method__Group__6
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__5__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getLeftParenthesisKeyword_5()); }
	'('
	{ after(grammarAccess.getMethodAccess().getLeftParenthesisKeyword_5()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__6
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group__6__Impl
	rule__Method__Group__7
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__6__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getGroup_6()); }
	(rule__Method__Group_6__0)?
	{ after(grammarAccess.getMethodAccess().getGroup_6()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__7
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group__7__Impl
	rule__Method__Group__8
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__7__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getRightParenthesisKeyword_7()); }
	')'
	{ after(grammarAccess.getMethodAccess().getRightParenthesisKeyword_7()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__8
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group__8__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group__8__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getAlternatives_8()); }
	(rule__Method__Alternatives_8)
	{ after(grammarAccess.getMethodAccess().getAlternatives_8()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Method__Group_6__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group_6__0__Impl
	rule__Method__Group_6__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group_6__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getParamsAssignment_6_0()); }
	(rule__Method__ParamsAssignment_6_0)
	{ after(grammarAccess.getMethodAccess().getParamsAssignment_6_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group_6__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group_6__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group_6__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getGroup_6_1()); }
	(rule__Method__Group_6_1__0)*
	{ after(grammarAccess.getMethodAccess().getGroup_6_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Method__Group_6_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group_6_1__0__Impl
	rule__Method__Group_6_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group_6_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getCommaKeyword_6_1_0()); }
	','
	{ after(grammarAccess.getMethodAccess().getCommaKeyword_6_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group_6_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Method__Group_6_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__Group_6_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMethodAccess().getParamsAssignment_6_1_1()); }
	(rule__Method__ParamsAssignment_6_1_1)
	{ after(grammarAccess.getMethodAccess().getParamsAssignment_6_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Parameter__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Parameter__Group__0__Impl
	rule__Parameter__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Parameter__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getParameterAccess().getTypeRefAssignment_0()); }
	(rule__Parameter__TypeRefAssignment_0)
	{ after(grammarAccess.getParameterAccess().getTypeRefAssignment_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Parameter__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Parameter__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Parameter__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getParameterAccess().getNameAssignment_1()); }
	(rule__Parameter__NameAssignment_1)
	{ after(grammarAccess.getParameterAccess().getNameAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Field__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Field__Group__0__Impl
	rule__Field__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getFieldAccess().getAccessAssignment_0()); }
	(rule__Field__AccessAssignment_0)?
	{ after(grammarAccess.getFieldAccess().getAccessAssignment_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Field__Group__1__Impl
	rule__Field__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getFieldAccess().getTypeRefAssignment_1()); }
	(rule__Field__TypeRefAssignment_1)
	{ after(grammarAccess.getFieldAccess().getTypeRefAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Field__Group__2__Impl
	rule__Field__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getFieldAccess().getNameAssignment_2()); }
	(rule__Field__NameAssignment_2)
	{ after(grammarAccess.getFieldAccess().getNameAssignment_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Field__Group__3__Impl
	rule__Field__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getFieldAccess().getGroup_3()); }
	(rule__Field__Group_3__0)?
	{ after(grammarAccess.getFieldAccess().getGroup_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Field__Group__4__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getFieldAccess().getSemicolonKeyword_4()); }
	';'
	{ after(grammarAccess.getFieldAccess().getSemicolonKeyword_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Field__Group_3__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Field__Group_3__0__Impl
	rule__Field__Group_3__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group_3__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getFieldAccess().getEqualsSignKeyword_3_0()); }
	'='
	{ after(grammarAccess.getFieldAccess().getEqualsSignKeyword_3_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group_3__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Field__Group_3__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__Group_3__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getFieldAccess().getDefaultValueAssignment_3_1()); }
	(rule__Field__DefaultValueAssignment_3_1)
	{ after(grammarAccess.getFieldAccess().getDefaultValueAssignment_3_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Block__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Block__Group__0__Impl
	rule__Block__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Block__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getBlockAccess().getBlockAction_0()); }
	()
	{ after(grammarAccess.getBlockAccess().getBlockAction_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Block__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Block__Group__1__Impl
	rule__Block__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Block__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getBlockAccess().getLeftCurlyBracketKeyword_1()); }
	'{'
	{ after(grammarAccess.getBlockAccess().getLeftCurlyBracketKeyword_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Block__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Block__Group__2__Impl
	rule__Block__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__Block__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getBlockAccess().getStatementsAssignment_2()); }
	(rule__Block__StatementsAssignment_2)*
	{ after(grammarAccess.getBlockAccess().getStatementsAssignment_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Block__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Block__Group__3__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Block__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getBlockAccess().getRightCurlyBracketKeyword_3()); }
	'}'
	{ after(grammarAccess.getBlockAccess().getRightCurlyBracketKeyword_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Statement__Group_0__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Statement__Group_0__0__Impl
	rule__Statement__Group_0__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_0__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getStatementAccess().getReturnParserRuleCall_0_0()); }
	ruleReturn
	{ after(grammarAccess.getStatementAccess().getReturnParserRuleCall_0_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_0__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Statement__Group_0__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_0__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getStatementAccess().getSemicolonKeyword_0_1()); }
	';'
	{ after(grammarAccess.getStatementAccess().getSemicolonKeyword_0_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Statement__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Statement__Group_1__0__Impl
	rule__Statement__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getStatementAccess().getAssignmentParserRuleCall_1_0()); }
	(ruleAssignment)
	{ after(grammarAccess.getStatementAccess().getAssignmentParserRuleCall_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Statement__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getStatementAccess().getSemicolonKeyword_1_1()); }
	';'
	{ after(grammarAccess.getStatementAccess().getSemicolonKeyword_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Statement__Group_5__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Statement__Group_5__0__Impl
	rule__Statement__Group_5__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_5__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getStatementAccess().getPrintStatementParserRuleCall_5_0()); }
	rulePrintStatement
	{ after(grammarAccess.getStatementAccess().getPrintStatementParserRuleCall_5_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_5__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Statement__Group_5__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_5__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getStatementAccess().getSemicolonKeyword_5_1()); }
	';'
	{ after(grammarAccess.getStatementAccess().getSemicolonKeyword_5_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Statement__Group_7__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Statement__Group_7__0__Impl
	rule__Statement__Group_7__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_7__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getStatementAccess().getSelectionExpressionParserRuleCall_7_0()); }
	ruleSelectionExpression
	{ after(grammarAccess.getStatementAccess().getSelectionExpressionParserRuleCall_7_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_7__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Statement__Group_7__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Statement__Group_7__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getStatementAccess().getSemicolonKeyword_7_1()); }
	';'
	{ after(grammarAccess.getStatementAccess().getSemicolonKeyword_7_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__PrintStatement__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PrintStatement__Group__0__Impl
	rule__PrintStatement__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrintStatementAccess().getSystemKeyword_0()); }
	'System'
	{ after(grammarAccess.getPrintStatementAccess().getSystemKeyword_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PrintStatement__Group__1__Impl
	rule__PrintStatement__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrintStatementAccess().getFullStopKeyword_1()); }
	'.'
	{ after(grammarAccess.getPrintStatementAccess().getFullStopKeyword_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PrintStatement__Group__2__Impl
	rule__PrintStatement__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrintStatementAccess().getOutKeyword_2()); }
	'out'
	{ after(grammarAccess.getPrintStatementAccess().getOutKeyword_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PrintStatement__Group__3__Impl
	rule__PrintStatement__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrintStatementAccess().getFullStopKeyword_3()); }
	'.'
	{ after(grammarAccess.getPrintStatementAccess().getFullStopKeyword_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PrintStatement__Group__4__Impl
	rule__PrintStatement__Group__5
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrintStatementAccess().getPrintlnKeyword_4()); }
	'println'
	{ after(grammarAccess.getPrintStatementAccess().getPrintlnKeyword_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__5
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PrintStatement__Group__5__Impl
	rule__PrintStatement__Group__6
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__5__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrintStatementAccess().getLeftParenthesisKeyword_5()); }
	'('
	{ after(grammarAccess.getPrintStatementAccess().getLeftParenthesisKeyword_5()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__6
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PrintStatement__Group__6__Impl
	rule__PrintStatement__Group__7
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__6__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrintStatementAccess().getExpressionAssignment_6()); }
	(rule__PrintStatement__ExpressionAssignment_6)
	{ after(grammarAccess.getPrintStatementAccess().getExpressionAssignment_6()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__7
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PrintStatement__Group__7__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__Group__7__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrintStatementAccess().getRightParenthesisKeyword_7()); }
	')'
	{ after(grammarAccess.getPrintStatementAccess().getRightParenthesisKeyword_7()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Return__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Return__Group__0__Impl
	rule__Return__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Return__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getReturnAccess().getReturnKeyword_0()); }
	'return'
	{ after(grammarAccess.getReturnAccess().getReturnKeyword_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Return__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Return__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Return__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getReturnAccess().getExpressionAssignment_1()); }
	(rule__Return__ExpressionAssignment_1)
	{ after(grammarAccess.getReturnAccess().getExpressionAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__IfStatement__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__IfStatement__Group__0__Impl
	rule__IfStatement__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getIfStatementAccess().getIfKeyword_0()); }
	'if'
	{ after(grammarAccess.getIfStatementAccess().getIfKeyword_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__IfStatement__Group__1__Impl
	rule__IfStatement__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getIfStatementAccess().getLeftParenthesisKeyword_1()); }
	'('
	{ after(grammarAccess.getIfStatementAccess().getLeftParenthesisKeyword_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__IfStatement__Group__2__Impl
	rule__IfStatement__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getIfStatementAccess().getExpressionAssignment_2()); }
	(rule__IfStatement__ExpressionAssignment_2)
	{ after(grammarAccess.getIfStatementAccess().getExpressionAssignment_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__IfStatement__Group__3__Impl
	rule__IfStatement__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getIfStatementAccess().getRightParenthesisKeyword_3()); }
	')'
	{ after(grammarAccess.getIfStatementAccess().getRightParenthesisKeyword_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__IfStatement__Group__4__Impl
	rule__IfStatement__Group__5
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getIfStatementAccess().getThenBlockAssignment_4()); }
	(rule__IfStatement__ThenBlockAssignment_4)
	{ after(grammarAccess.getIfStatementAccess().getThenBlockAssignment_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__5
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__IfStatement__Group__5__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group__5__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getIfStatementAccess().getGroup_5()); }
	(rule__IfStatement__Group_5__0)?
	{ after(grammarAccess.getIfStatementAccess().getGroup_5()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__IfStatement__Group_5__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__IfStatement__Group_5__0__Impl
	rule__IfStatement__Group_5__1
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group_5__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getIfStatementAccess().getElseKeyword_5_0()); }
	('else')
	{ after(grammarAccess.getIfStatementAccess().getElseKeyword_5_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group_5__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__IfStatement__Group_5__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__Group_5__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getIfStatementAccess().getElseBlockAssignment_5_1()); }
	(rule__IfStatement__ElseBlockAssignment_5_1)
	{ after(grammarAccess.getIfStatementAccess().getElseBlockAssignment_5_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__WhileStatement__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__WhileStatement__Group__0__Impl
	rule__WhileStatement__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getWhileStatementAccess().getWhileKeyword_0()); }
	'while'
	{ after(grammarAccess.getWhileStatementAccess().getWhileKeyword_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__WhileStatement__Group__1__Impl
	rule__WhileStatement__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getWhileStatementAccess().getLeftParenthesisKeyword_1()); }
	'('
	{ after(grammarAccess.getWhileStatementAccess().getLeftParenthesisKeyword_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__WhileStatement__Group__2__Impl
	rule__WhileStatement__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getWhileStatementAccess().getConditionAssignment_2()); }
	(rule__WhileStatement__ConditionAssignment_2)
	{ after(grammarAccess.getWhileStatementAccess().getConditionAssignment_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__WhileStatement__Group__3__Impl
	rule__WhileStatement__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getWhileStatementAccess().getRightParenthesisKeyword_3()); }
	')'
	{ after(grammarAccess.getWhileStatementAccess().getRightParenthesisKeyword_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__Group__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__WhileStatement__Group__4__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__Group__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getWhileStatementAccess().getBlockAssignment_4()); }
	(rule__WhileStatement__BlockAssignment_4)
	{ after(grammarAccess.getWhileStatementAccess().getBlockAssignment_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__ForStatement__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ForStatement__Group__0__Impl
	rule__ForStatement__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getForStatementAccess().getForKeyword_0()); }
	'for'
	{ after(grammarAccess.getForStatementAccess().getForKeyword_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ForStatement__Group__1__Impl
	rule__ForStatement__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getForStatementAccess().getLeftParenthesisKeyword_1()); }
	'('
	{ after(grammarAccess.getForStatementAccess().getLeftParenthesisKeyword_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ForStatement__Group__2__Impl
	rule__ForStatement__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getForStatementAccess().getDeclarationAssignment_2()); }
	(rule__ForStatement__DeclarationAssignment_2)
	{ after(grammarAccess.getForStatementAccess().getDeclarationAssignment_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ForStatement__Group__3__Impl
	rule__ForStatement__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getForStatementAccess().getSemicolonKeyword_3()); }
	';'
	{ after(grammarAccess.getForStatementAccess().getSemicolonKeyword_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ForStatement__Group__4__Impl
	rule__ForStatement__Group__5
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getForStatementAccess().getConditionAssignment_4()); }
	(rule__ForStatement__ConditionAssignment_4)
	{ after(grammarAccess.getForStatementAccess().getConditionAssignment_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__5
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ForStatement__Group__5__Impl
	rule__ForStatement__Group__6
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__5__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getForStatementAccess().getSemicolonKeyword_5()); }
	';'
	{ after(grammarAccess.getForStatementAccess().getSemicolonKeyword_5()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__6
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ForStatement__Group__6__Impl
	rule__ForStatement__Group__7
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__6__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getForStatementAccess().getProgressionAssignment_6()); }
	(rule__ForStatement__ProgressionAssignment_6)
	{ after(grammarAccess.getForStatementAccess().getProgressionAssignment_6()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__7
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ForStatement__Group__7__Impl
	rule__ForStatement__Group__8
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__7__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getForStatementAccess().getRightParenthesisKeyword_7()); }
	')'
	{ after(grammarAccess.getForStatementAccess().getRightParenthesisKeyword_7()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__8
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ForStatement__Group__8__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__Group__8__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getForStatementAccess().getBlockAssignment_8()); }
	(rule__ForStatement__BlockAssignment_8)
	{ after(grammarAccess.getForStatementAccess().getBlockAssignment_8()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TypeRef__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TypeRef__Group__0__Impl
	rule__TypeRef__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TypeRef__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTypeRefAccess().getSingleTypeRefParserRuleCall_0()); }
	ruleSingleTypeRef
	{ after(grammarAccess.getTypeRefAccess().getSingleTypeRefParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TypeRef__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TypeRef__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TypeRef__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTypeRefAccess().getGroup_1()); }
	(rule__TypeRef__Group_1__0)?
	{ after(grammarAccess.getTypeRefAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TypeRef__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TypeRef__Group_1__0__Impl
	rule__TypeRef__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TypeRef__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTypeRefAccess().getArrayTypeRefTypeRefAction_1_0()); }
	()
	{ after(grammarAccess.getTypeRefAccess().getArrayTypeRefTypeRefAction_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TypeRef__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TypeRef__Group_1__1__Impl
	rule__TypeRef__Group_1__2
;
finally {
	restoreStackSize(stackSize);
}

rule__TypeRef__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTypeRefAccess().getLeftSquareBracketKeyword_1_1()); }
	'['
	{ after(grammarAccess.getTypeRefAccess().getLeftSquareBracketKeyword_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TypeRef__Group_1__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TypeRef__Group_1__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TypeRef__Group_1__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTypeRefAccess().getRightSquareBracketKeyword_1_2()); }
	']'
	{ after(grammarAccess.getTypeRefAccess().getRightSquareBracketKeyword_1_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__SingleTypeRef__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SingleTypeRef__Group_1__0__Impl
	rule__SingleTypeRef__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSingleTypeRefAccess().getIntegerTypeRefAction_1_0()); }
	()
	{ after(grammarAccess.getSingleTypeRefAccess().getIntegerTypeRefAction_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SingleTypeRef__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSingleTypeRefAccess().getIntKeyword_1_1()); }
	'int'
	{ after(grammarAccess.getSingleTypeRefAccess().getIntKeyword_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__SingleTypeRef__Group_2__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SingleTypeRef__Group_2__0__Impl
	rule__SingleTypeRef__Group_2__1
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_2__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSingleTypeRefAccess().getBooleanTypeRefAction_2_0()); }
	()
	{ after(grammarAccess.getSingleTypeRefAccess().getBooleanTypeRefAction_2_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_2__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SingleTypeRef__Group_2__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_2__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSingleTypeRefAccess().getBooleanKeyword_2_1()); }
	'boolean'
	{ after(grammarAccess.getSingleTypeRefAccess().getBooleanKeyword_2_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__SingleTypeRef__Group_3__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SingleTypeRef__Group_3__0__Impl
	rule__SingleTypeRef__Group_3__1
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_3__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSingleTypeRefAccess().getStringTypeRefAction_3_0()); }
	()
	{ after(grammarAccess.getSingleTypeRefAccess().getStringTypeRefAction_3_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_3__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SingleTypeRef__Group_3__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_3__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSingleTypeRefAccess().getStringKeyword_3_1()); }
	'String'
	{ after(grammarAccess.getSingleTypeRefAccess().getStringKeyword_3_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__SingleTypeRef__Group_4__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SingleTypeRef__Group_4__0__Impl
	rule__SingleTypeRef__Group_4__1
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_4__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSingleTypeRefAccess().getVoidTypeRefAction_4_0()); }
	()
	{ after(grammarAccess.getSingleTypeRefAccess().getVoidTypeRefAction_4_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_4__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SingleTypeRef__Group_4__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__SingleTypeRef__Group_4__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSingleTypeRefAccess().getVoidKeyword_4_1()); }
	'void'
	{ after(grammarAccess.getSingleTypeRefAccess().getVoidKeyword_4_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__VariableDeclaration__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__VariableDeclaration__Group__0__Impl
	rule__VariableDeclaration__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__VariableDeclaration__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getVariableDeclarationAccess().getTypeRefAssignment_0()); }
	(rule__VariableDeclaration__TypeRefAssignment_0)
	{ after(grammarAccess.getVariableDeclarationAccess().getTypeRefAssignment_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__VariableDeclaration__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__VariableDeclaration__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__VariableDeclaration__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getVariableDeclarationAccess().getNameAssignment_1()); }
	(rule__VariableDeclaration__NameAssignment_1)
	{ after(grammarAccess.getVariableDeclarationAccess().getNameAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Assignment__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Assignment__Group__0__Impl
	rule__Assignment__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Assignment__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getAssignmentAccess().getAssigneeAssignment_0()); }
	(rule__Assignment__AssigneeAssignment_0)
	{ after(grammarAccess.getAssignmentAccess().getAssigneeAssignment_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Assignment__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Assignment__Group__1__Impl
	rule__Assignment__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Assignment__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getAssignmentAccess().getEqualsSignKeyword_1()); }
	'='
	{ after(grammarAccess.getAssignmentAccess().getEqualsSignKeyword_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Assignment__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Assignment__Group__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Assignment__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getAssignmentAccess().getValueAssignment_2()); }
	(rule__Assignment__ValueAssignment_2)
	{ after(grammarAccess.getAssignmentAccess().getValueAssignment_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Or__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Or__Group__0__Impl
	rule__Or__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Or__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getOrAccess().getAndParserRuleCall_0()); }
	ruleAnd
	{ after(grammarAccess.getOrAccess().getAndParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Or__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Or__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Or__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getOrAccess().getGroup_1()); }
	(rule__Or__Group_1__0)*
	{ after(grammarAccess.getOrAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Or__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Or__Group_1__0__Impl
	rule__Or__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Or__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getOrAccess().getOrLeftAction_1_0()); }
	()
	{ after(grammarAccess.getOrAccess().getOrLeftAction_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Or__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Or__Group_1__1__Impl
	rule__Or__Group_1__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Or__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getOrAccess().getVerticalLineVerticalLineKeyword_1_1()); }
	'||'
	{ after(grammarAccess.getOrAccess().getVerticalLineVerticalLineKeyword_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Or__Group_1__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Or__Group_1__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Or__Group_1__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getOrAccess().getRightAssignment_1_2()); }
	(rule__Or__RightAssignment_1_2)
	{ after(grammarAccess.getOrAccess().getRightAssignment_1_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__And__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__And__Group__0__Impl
	rule__And__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__And__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getAndAccess().getEqualityParserRuleCall_0()); }
	ruleEquality
	{ after(grammarAccess.getAndAccess().getEqualityParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__And__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__And__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__And__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getAndAccess().getGroup_1()); }
	(rule__And__Group_1__0)*
	{ after(grammarAccess.getAndAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__And__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__And__Group_1__0__Impl
	rule__And__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__And__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getAndAccess().getAndLeftAction_1_0()); }
	()
	{ after(grammarAccess.getAndAccess().getAndLeftAction_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__And__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__And__Group_1__1__Impl
	rule__And__Group_1__2
;
finally {
	restoreStackSize(stackSize);
}

rule__And__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getAndAccess().getAmpersandAmpersandKeyword_1_1()); }
	'&&'
	{ after(grammarAccess.getAndAccess().getAmpersandAmpersandKeyword_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__And__Group_1__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__And__Group_1__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__And__Group_1__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getAndAccess().getRightAssignment_1_2()); }
	(rule__And__RightAssignment_1_2)
	{ after(grammarAccess.getAndAccess().getRightAssignment_1_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Equality__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Equality__Group__0__Impl
	rule__Equality__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEqualityAccess().getComparisonParserRuleCall_0()); }
	ruleComparison
	{ after(grammarAccess.getEqualityAccess().getComparisonParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Equality__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEqualityAccess().getGroup_1()); }
	(rule__Equality__Group_1__0)*
	{ after(grammarAccess.getEqualityAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Equality__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Equality__Group_1__0__Impl
	rule__Equality__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEqualityAccess().getAlternatives_1_0()); }
	(rule__Equality__Alternatives_1_0)
	{ after(grammarAccess.getEqualityAccess().getAlternatives_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Equality__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEqualityAccess().getRightAssignment_1_1()); }
	(rule__Equality__RightAssignment_1_1)
	{ after(grammarAccess.getEqualityAccess().getRightAssignment_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Equality__Group_1_0_0__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Equality__Group_1_0_0__0__Impl
	rule__Equality__Group_1_0_0__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group_1_0_0__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEqualityAccess().getEqualityLeftAction_1_0_0_0()); }
	()
	{ after(grammarAccess.getEqualityAccess().getEqualityLeftAction_1_0_0_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group_1_0_0__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Equality__Group_1_0_0__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group_1_0_0__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEqualityAccess().getEqualsSignEqualsSignKeyword_1_0_0_1()); }
	'=='
	{ after(grammarAccess.getEqualityAccess().getEqualsSignEqualsSignKeyword_1_0_0_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Equality__Group_1_0_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Equality__Group_1_0_1__0__Impl
	rule__Equality__Group_1_0_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group_1_0_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEqualityAccess().getInequalityLeftAction_1_0_1_0()); }
	()
	{ after(grammarAccess.getEqualityAccess().getInequalityLeftAction_1_0_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group_1_0_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Equality__Group_1_0_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__Group_1_0_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEqualityAccess().getExclamationMarkEqualsSignKeyword_1_0_1_1()); }
	'!='
	{ after(grammarAccess.getEqualityAccess().getExclamationMarkEqualsSignKeyword_1_0_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Comparison__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group__0__Impl
	rule__Comparison__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getPlusOrMinusParserRuleCall_0()); }
	rulePlusOrMinus
	{ after(grammarAccess.getComparisonAccess().getPlusOrMinusParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getGroup_1()); }
	(rule__Comparison__Group_1__0)*
	{ after(grammarAccess.getComparisonAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Comparison__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group_1__0__Impl
	rule__Comparison__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getAlternatives_1_0()); }
	(rule__Comparison__Alternatives_1_0)
	{ after(grammarAccess.getComparisonAccess().getAlternatives_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getRightAssignment_1_1()); }
	(rule__Comparison__RightAssignment_1_1)
	{ after(grammarAccess.getComparisonAccess().getRightAssignment_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Comparison__Group_1_0_0__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group_1_0_0__0__Impl
	rule__Comparison__Group_1_0_0__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_0__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getSuperiorOrEqualLeftAction_1_0_0_0()); }
	()
	{ after(grammarAccess.getComparisonAccess().getSuperiorOrEqualLeftAction_1_0_0_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_0__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group_1_0_0__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_0__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getGreaterThanSignEqualsSignKeyword_1_0_0_1()); }
	'>='
	{ after(grammarAccess.getComparisonAccess().getGreaterThanSignEqualsSignKeyword_1_0_0_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Comparison__Group_1_0_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group_1_0_1__0__Impl
	rule__Comparison__Group_1_0_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getInferiorOrEqualLeftAction_1_0_1_0()); }
	()
	{ after(grammarAccess.getComparisonAccess().getInferiorOrEqualLeftAction_1_0_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group_1_0_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getLessThanSignEqualsSignKeyword_1_0_1_1()); }
	'<='
	{ after(grammarAccess.getComparisonAccess().getLessThanSignEqualsSignKeyword_1_0_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Comparison__Group_1_0_2__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group_1_0_2__0__Impl
	rule__Comparison__Group_1_0_2__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_2__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getSuperiorLeftAction_1_0_2_0()); }
	()
	{ after(grammarAccess.getComparisonAccess().getSuperiorLeftAction_1_0_2_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_2__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group_1_0_2__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_2__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getGreaterThanSignKeyword_1_0_2_1()); }
	'>'
	{ after(grammarAccess.getComparisonAccess().getGreaterThanSignKeyword_1_0_2_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Comparison__Group_1_0_3__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group_1_0_3__0__Impl
	rule__Comparison__Group_1_0_3__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_3__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getInferiorLeftAction_1_0_3_0()); }
	()
	{ after(grammarAccess.getComparisonAccess().getInferiorLeftAction_1_0_3_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_3__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Comparison__Group_1_0_3__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__Group_1_0_3__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getComparisonAccess().getLessThanSignKeyword_1_0_3_1()); }
	'<'
	{ after(grammarAccess.getComparisonAccess().getLessThanSignKeyword_1_0_3_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__PlusOrMinus__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PlusOrMinus__Group__0__Impl
	rule__PlusOrMinus__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPlusOrMinusAccess().getMulOrDivParserRuleCall_0()); }
	ruleMulOrDiv
	{ after(grammarAccess.getPlusOrMinusAccess().getMulOrDivParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PlusOrMinus__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPlusOrMinusAccess().getGroup_1()); }
	(rule__PlusOrMinus__Group_1__0)*
	{ after(grammarAccess.getPlusOrMinusAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__PlusOrMinus__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PlusOrMinus__Group_1__0__Impl
	rule__PlusOrMinus__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPlusOrMinusAccess().getAlternatives_1_0()); }
	(rule__PlusOrMinus__Alternatives_1_0)
	{ after(grammarAccess.getPlusOrMinusAccess().getAlternatives_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PlusOrMinus__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPlusOrMinusAccess().getRightAssignment_1_1()); }
	(rule__PlusOrMinus__RightAssignment_1_1)
	{ after(grammarAccess.getPlusOrMinusAccess().getRightAssignment_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__PlusOrMinus__Group_1_0_0__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PlusOrMinus__Group_1_0_0__0__Impl
	rule__PlusOrMinus__Group_1_0_0__1
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group_1_0_0__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPlusOrMinusAccess().getPlusLeftAction_1_0_0_0()); }
	()
	{ after(grammarAccess.getPlusOrMinusAccess().getPlusLeftAction_1_0_0_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group_1_0_0__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PlusOrMinus__Group_1_0_0__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group_1_0_0__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPlusOrMinusAccess().getPlusSignKeyword_1_0_0_1()); }
	'+'
	{ after(grammarAccess.getPlusOrMinusAccess().getPlusSignKeyword_1_0_0_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__PlusOrMinus__Group_1_0_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PlusOrMinus__Group_1_0_1__0__Impl
	rule__PlusOrMinus__Group_1_0_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group_1_0_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPlusOrMinusAccess().getMinusLeftAction_1_0_1_0()); }
	()
	{ after(grammarAccess.getPlusOrMinusAccess().getMinusLeftAction_1_0_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group_1_0_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__PlusOrMinus__Group_1_0_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__Group_1_0_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPlusOrMinusAccess().getHyphenMinusKeyword_1_0_1_1()); }
	'-'
	{ after(grammarAccess.getPlusOrMinusAccess().getHyphenMinusKeyword_1_0_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__MulOrDiv__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__MulOrDiv__Group__0__Impl
	rule__MulOrDiv__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMulOrDivAccess().getArrayAccessParserRuleCall_0()); }
	ruleArrayAccess
	{ after(grammarAccess.getMulOrDivAccess().getArrayAccessParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__MulOrDiv__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMulOrDivAccess().getGroup_1()); }
	(rule__MulOrDiv__Group_1__0)*
	{ after(grammarAccess.getMulOrDivAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__MulOrDiv__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__MulOrDiv__Group_1__0__Impl
	rule__MulOrDiv__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMulOrDivAccess().getAlternatives_1_0()); }
	(rule__MulOrDiv__Alternatives_1_0)
	{ after(grammarAccess.getMulOrDivAccess().getAlternatives_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__MulOrDiv__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMulOrDivAccess().getRightAssignment_1_1()); }
	(rule__MulOrDiv__RightAssignment_1_1)
	{ after(grammarAccess.getMulOrDivAccess().getRightAssignment_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__MulOrDiv__Group_1_0_0__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__MulOrDiv__Group_1_0_0__0__Impl
	rule__MulOrDiv__Group_1_0_0__1
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group_1_0_0__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMulOrDivAccess().getMultiplicationLeftAction_1_0_0_0()); }
	()
	{ after(grammarAccess.getMulOrDivAccess().getMultiplicationLeftAction_1_0_0_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group_1_0_0__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__MulOrDiv__Group_1_0_0__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group_1_0_0__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMulOrDivAccess().getAsteriskKeyword_1_0_0_1()); }
	'*'
	{ after(grammarAccess.getMulOrDivAccess().getAsteriskKeyword_1_0_0_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__MulOrDiv__Group_1_0_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__MulOrDiv__Group_1_0_1__0__Impl
	rule__MulOrDiv__Group_1_0_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group_1_0_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMulOrDivAccess().getDivisionLeftAction_1_0_1_0()); }
	()
	{ after(grammarAccess.getMulOrDivAccess().getDivisionLeftAction_1_0_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group_1_0_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__MulOrDiv__Group_1_0_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__Group_1_0_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getMulOrDivAccess().getSolidusKeyword_1_0_1_1()); }
	'/'
	{ after(grammarAccess.getMulOrDivAccess().getSolidusKeyword_1_0_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__ArrayAccess__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayAccess__Group__0__Impl
	rule__ArrayAccess__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayAccessAccess().getArrayLengthParserRuleCall_0()); }
	ruleArrayLength
	{ after(grammarAccess.getArrayAccessAccess().getArrayLengthParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayAccess__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayAccessAccess().getGroup_1()); }
	(rule__ArrayAccess__Group_1__0)?
	{ after(grammarAccess.getArrayAccessAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__ArrayAccess__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayAccess__Group_1__0__Impl
	rule__ArrayAccess__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayAccessAccess().getArrayAccessObjectAction_1_0()); }
	()
	{ after(grammarAccess.getArrayAccessAccess().getArrayAccessObjectAction_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayAccess__Group_1__1__Impl
	rule__ArrayAccess__Group_1__2
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayAccessAccess().getLeftSquareBracketKeyword_1_1()); }
	'['
	{ after(grammarAccess.getArrayAccessAccess().getLeftSquareBracketKeyword_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__Group_1__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayAccess__Group_1__2__Impl
	rule__ArrayAccess__Group_1__3
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__Group_1__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayAccessAccess().getIndexAssignment_1_2()); }
	(rule__ArrayAccess__IndexAssignment_1_2)
	{ after(grammarAccess.getArrayAccessAccess().getIndexAssignment_1_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__Group_1__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayAccess__Group_1__3__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__Group_1__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayAccessAccess().getRightSquareBracketKeyword_1_3()); }
	']'
	{ after(grammarAccess.getArrayAccessAccess().getRightSquareBracketKeyword_1_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__ArrayLength__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayLength__Group__0__Impl
	rule__ArrayLength__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayLength__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayLengthAccess().getPrimaryParserRuleCall_0()); }
	rulePrimary
	{ after(grammarAccess.getArrayLengthAccess().getPrimaryParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayLength__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayLength__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayLength__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayLengthAccess().getGroup_1()); }
	(rule__ArrayLength__Group_1__0)?
	{ after(grammarAccess.getArrayLengthAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__ArrayLength__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayLength__Group_1__0__Impl
	rule__ArrayLength__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayLength__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayLengthAccess().getArrayLengthArrayAction_1_0()); }
	()
	{ after(grammarAccess.getArrayLengthAccess().getArrayLengthArrayAction_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayLength__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayLength__Group_1__1__Impl
	rule__ArrayLength__Group_1__2
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayLength__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayLengthAccess().getFullStopKeyword_1_1()); }
	'.'
	{ after(grammarAccess.getArrayLengthAccess().getFullStopKeyword_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayLength__Group_1__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__ArrayLength__Group_1__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayLength__Group_1__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getArrayLengthAccess().getLengthKeyword_1_2()); }
	'length'
	{ after(grammarAccess.getArrayLengthAccess().getLengthKeyword_1_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Primary__Group_0__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Primary__Group_0__0__Impl
	rule__Primary__Group_0__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_0__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrimaryAccess().getLeftParenthesisKeyword_0_0()); }
	'('
	{ after(grammarAccess.getPrimaryAccess().getLeftParenthesisKeyword_0_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_0__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Primary__Group_0__1__Impl
	rule__Primary__Group_0__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_0__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrimaryAccess().getExpressionParserRuleCall_0_1()); }
	ruleExpression
	{ after(grammarAccess.getPrimaryAccess().getExpressionParserRuleCall_0_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_0__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Primary__Group_0__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_0__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrimaryAccess().getRightParenthesisKeyword_0_2()); }
	')'
	{ after(grammarAccess.getPrimaryAccess().getRightParenthesisKeyword_0_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Primary__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Primary__Group_1__0__Impl
	rule__Primary__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrimaryAccess().getNotAction_1_0()); }
	()
	{ after(grammarAccess.getPrimaryAccess().getNotAction_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Primary__Group_1__1__Impl
	rule__Primary__Group_1__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrimaryAccess().getExclamationMarkKeyword_1_1()); }
	('!')
	{ after(grammarAccess.getPrimaryAccess().getExclamationMarkKeyword_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_1__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Primary__Group_1__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_1__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrimaryAccess().getExpressionAssignment_1_2()); }
	(rule__Primary__ExpressionAssignment_1_2)
	{ after(grammarAccess.getPrimaryAccess().getExpressionAssignment_1_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Primary__Group_2__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Primary__Group_2__0__Impl
	rule__Primary__Group_2__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_2__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrimaryAccess().getNegAction_2_0()); }
	()
	{ after(grammarAccess.getPrimaryAccess().getNegAction_2_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_2__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Primary__Group_2__1__Impl
	rule__Primary__Group_2__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_2__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrimaryAccess().getHyphenMinusKeyword_2_1()); }
	('-')
	{ after(grammarAccess.getPrimaryAccess().getHyphenMinusKeyword_2_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_2__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Primary__Group_2__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__Group_2__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPrimaryAccess().getExpressionAssignment_2_2()); }
	(rule__Primary__ExpressionAssignment_2_2)
	{ after(grammarAccess.getPrimaryAccess().getExpressionAssignment_2_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__SelectionExpression__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group__0__Impl
	rule__SelectionExpression__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getTerminalExpressionParserRuleCall_0()); }
	ruleTerminalExpression
	{ after(grammarAccess.getSelectionExpressionAccess().getTerminalExpressionParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getAlternatives_1()); }
	(rule__SelectionExpression__Alternatives_1)*
	{ after(grammarAccess.getSelectionExpressionAccess().getAlternatives_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__SelectionExpression__Group_1_0__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_0__0__Impl
	rule__SelectionExpression__Group_1_0__1
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_0__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getFieldAccessReceiverAction_1_0_0()); }
	()
	{ after(grammarAccess.getSelectionExpressionAccess().getFieldAccessReceiverAction_1_0_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_0__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_0__1__Impl
	rule__SelectionExpression__Group_1_0__2
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_0__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getFullStopKeyword_1_0_1()); }
	'.'
	{ after(grammarAccess.getSelectionExpressionAccess().getFullStopKeyword_1_0_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_0__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_0__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_0__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getFieldAssignment_1_0_2()); }
	(rule__SelectionExpression__FieldAssignment_1_0_2)
	{ after(grammarAccess.getSelectionExpressionAccess().getFieldAssignment_1_0_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__SelectionExpression__Group_1_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_1__0__Impl
	rule__SelectionExpression__Group_1_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getMethodCallReceiverAction_1_1_0()); }
	()
	{ after(grammarAccess.getSelectionExpressionAccess().getMethodCallReceiverAction_1_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_1__1__Impl
	rule__SelectionExpression__Group_1_1__2
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getFullStopKeyword_1_1_1()); }
	'.'
	{ after(grammarAccess.getSelectionExpressionAccess().getFullStopKeyword_1_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_1__2__Impl
	rule__SelectionExpression__Group_1_1__3
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getMethodAssignment_1_1_2()); }
	(rule__SelectionExpression__MethodAssignment_1_1_2)
	{ after(grammarAccess.getSelectionExpressionAccess().getMethodAssignment_1_1_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_1__3__Impl
	rule__SelectionExpression__Group_1_1__4
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getLeftParenthesisKeyword_1_1_3()); }
	'('
	{ after(grammarAccess.getSelectionExpressionAccess().getLeftParenthesisKeyword_1_1_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_1__4__Impl
	rule__SelectionExpression__Group_1_1__5
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getGroup_1_1_4()); }
	(rule__SelectionExpression__Group_1_1_4__0)?
	{ after(grammarAccess.getSelectionExpressionAccess().getGroup_1_1_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__5
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_1__5__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1__5__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getRightParenthesisKeyword_1_1_5()); }
	')'
	{ after(grammarAccess.getSelectionExpressionAccess().getRightParenthesisKeyword_1_1_5()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__SelectionExpression__Group_1_1_4__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_1_4__0__Impl
	rule__SelectionExpression__Group_1_1_4__1
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1_4__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getArgsAssignment_1_1_4_0()); }
	(rule__SelectionExpression__ArgsAssignment_1_1_4_0)
	{ after(grammarAccess.getSelectionExpressionAccess().getArgsAssignment_1_1_4_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1_4__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_1_4__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1_4__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getGroup_1_1_4_1()); }
	(rule__SelectionExpression__Group_1_1_4_1__0)*
	{ after(grammarAccess.getSelectionExpressionAccess().getGroup_1_1_4_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__SelectionExpression__Group_1_1_4_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_1_4_1__0__Impl
	rule__SelectionExpression__Group_1_1_4_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1_4_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getCommaKeyword_1_1_4_1_0()); }
	','
	{ after(grammarAccess.getSelectionExpressionAccess().getCommaKeyword_1_1_4_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1_4_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__SelectionExpression__Group_1_1_4_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__Group_1_1_4_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getSelectionExpressionAccess().getArgsAssignment_1_1_4_1_1()); }
	(rule__SelectionExpression__ArgsAssignment_1_1_4_1_1)
	{ after(grammarAccess.getSelectionExpressionAccess().getArgsAssignment_1_1_4_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_0__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_0__0__Impl
	rule__TerminalExpression__Group_0__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_0__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getStringConstantAction_0_0()); }
	()
	{ after(grammarAccess.getTerminalExpressionAccess().getStringConstantAction_0_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_0__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_0__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_0__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getValueAssignment_0_1()); }
	(rule__TerminalExpression__ValueAssignment_0_1)
	{ after(grammarAccess.getTerminalExpressionAccess().getValueAssignment_0_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_1__0__Impl
	rule__TerminalExpression__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getIntConstantAction_1_0()); }
	()
	{ after(grammarAccess.getTerminalExpressionAccess().getIntConstantAction_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getValueAssignment_1_1()); }
	(rule__TerminalExpression__ValueAssignment_1_1)
	{ after(grammarAccess.getTerminalExpressionAccess().getValueAssignment_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_2__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_2__0__Impl
	rule__TerminalExpression__Group_2__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_2__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getBoolConstantAction_2_0()); }
	()
	{ after(grammarAccess.getTerminalExpressionAccess().getBoolConstantAction_2_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_2__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_2__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_2__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getValueAssignment_2_1()); }
	(rule__TerminalExpression__ValueAssignment_2_1)
	{ after(grammarAccess.getTerminalExpressionAccess().getValueAssignment_2_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_3__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_3__0__Impl
	rule__TerminalExpression__Group_3__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_3__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getThisAction_3_0()); }
	()
	{ after(grammarAccess.getTerminalExpressionAccess().getThisAction_3_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_3__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_3__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_3__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getThisKeyword_3_1()); }
	'this'
	{ after(grammarAccess.getTerminalExpressionAccess().getThisKeyword_3_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_4__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_4__0__Impl
	rule__TerminalExpression__Group_4__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_4__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getSuperAction_4_0()); }
	()
	{ after(grammarAccess.getTerminalExpressionAccess().getSuperAction_4_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_4__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_4__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_4__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getSuperKeyword_4_1()); }
	'super'
	{ after(grammarAccess.getTerminalExpressionAccess().getSuperKeyword_4_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_5__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_5__0__Impl
	rule__TerminalExpression__Group_5__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_5__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getNullAction_5_0()); }
	()
	{ after(grammarAccess.getTerminalExpressionAccess().getNullAction_5_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_5__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_5__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_5__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getNullKeyword_5_1()); }
	'null'
	{ after(grammarAccess.getTerminalExpressionAccess().getNullKeyword_5_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_6__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_6__0__Impl
	rule__TerminalExpression__Group_6__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getNewObjectAction_6_0()); }
	()
	{ after(grammarAccess.getTerminalExpressionAccess().getNewObjectAction_6_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_6__1__Impl
	rule__TerminalExpression__Group_6__2
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getNewKeyword_6_1()); }
	'new'
	{ after(grammarAccess.getTerminalExpressionAccess().getNewKeyword_6_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_6__2__Impl
	rule__TerminalExpression__Group_6__3
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getTypeAssignment_6_2()); }
	(rule__TerminalExpression__TypeAssignment_6_2)
	{ after(grammarAccess.getTerminalExpressionAccess().getTypeAssignment_6_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_6__3__Impl
	rule__TerminalExpression__Group_6__4
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getLeftParenthesisKeyword_6_3()); }
	('(')
	{ after(grammarAccess.getTerminalExpressionAccess().getLeftParenthesisKeyword_6_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_6__4__Impl
	rule__TerminalExpression__Group_6__5
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getGroup_6_4()); }
	(rule__TerminalExpression__Group_6_4__0)?
	{ after(grammarAccess.getTerminalExpressionAccess().getGroup_6_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__5
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_6__5__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6__5__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getRightParenthesisKeyword_6_5()); }
	')'
	{ after(grammarAccess.getTerminalExpressionAccess().getRightParenthesisKeyword_6_5()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_6_4__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_6_4__0__Impl
	rule__TerminalExpression__Group_6_4__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6_4__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getArgsAssignment_6_4_0()); }
	(rule__TerminalExpression__ArgsAssignment_6_4_0)
	{ after(grammarAccess.getTerminalExpressionAccess().getArgsAssignment_6_4_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6_4__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_6_4__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6_4__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getGroup_6_4_1()); }
	(rule__TerminalExpression__Group_6_4_1__0)*
	{ after(grammarAccess.getTerminalExpressionAccess().getGroup_6_4_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_6_4_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_6_4_1__0__Impl
	rule__TerminalExpression__Group_6_4_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6_4_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getCommaKeyword_6_4_1_0()); }
	','
	{ after(grammarAccess.getTerminalExpressionAccess().getCommaKeyword_6_4_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6_4_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_6_4_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_6_4_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getArgsAssignment_6_4_1_1()); }
	(rule__TerminalExpression__ArgsAssignment_6_4_1_1)
	{ after(grammarAccess.getTerminalExpressionAccess().getArgsAssignment_6_4_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_7__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_7__0__Impl
	rule__TerminalExpression__Group_7__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getNewArrayAction_7_0()); }
	()
	{ after(grammarAccess.getTerminalExpressionAccess().getNewArrayAction_7_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_7__1__Impl
	rule__TerminalExpression__Group_7__2
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getNewKeyword_7_1()); }
	'new'
	{ after(grammarAccess.getTerminalExpressionAccess().getNewKeyword_7_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_7__2__Impl
	rule__TerminalExpression__Group_7__3
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getTypeAssignment_7_2()); }
	(rule__TerminalExpression__TypeAssignment_7_2)
	{ after(grammarAccess.getTerminalExpressionAccess().getTypeAssignment_7_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_7__3__Impl
	rule__TerminalExpression__Group_7__4
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getLeftSquareBracketKeyword_7_3()); }
	('[')
	{ after(grammarAccess.getTerminalExpressionAccess().getLeftSquareBracketKeyword_7_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_7__4__Impl
	rule__TerminalExpression__Group_7__5
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getSizeAssignment_7_4()); }
	(rule__TerminalExpression__SizeAssignment_7_4)
	{ after(grammarAccess.getTerminalExpressionAccess().getSizeAssignment_7_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__5
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_7__5__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_7__5__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getRightSquareBracketKeyword_7_5()); }
	']'
	{ after(grammarAccess.getTerminalExpressionAccess().getRightSquareBracketKeyword_7_5()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__TerminalExpression__Group_8__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_8__0__Impl
	rule__TerminalExpression__Group_8__1
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_8__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getSymbolRefAction_8_0()); }
	()
	{ after(grammarAccess.getTerminalExpressionAccess().getSymbolRefAction_8_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_8__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__TerminalExpression__Group_8__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__Group_8__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getTerminalExpressionAccess().getSymbolAssignment_8_1()); }
	(rule__TerminalExpression__SymbolAssignment_8_1)
	{ after(grammarAccess.getTerminalExpressionAccess().getSymbolAssignment_8_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Program__NameAssignment_0_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getProgramAccess().getNameQualifiedNameParserRuleCall_0_1_0()); }
		ruleQualifiedName
		{ after(grammarAccess.getProgramAccess().getNameQualifiedNameParserRuleCall_0_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__ImportsAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getProgramAccess().getImportsImportParserRuleCall_1_0()); }
		ruleImport
		{ after(grammarAccess.getProgramAccess().getImportsImportParserRuleCall_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Program__ClassesAssignment_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getProgramAccess().getClassesTypeDeclarationParserRuleCall_2_0()); }
		ruleTypeDeclaration
		{ after(grammarAccess.getProgramAccess().getClassesTypeDeclarationParserRuleCall_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__ImportedNamespaceAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getImportAccess().getImportedNamespaceQualifiedNameWithWildcardParserRuleCall_1_0()); }
		ruleQualifiedNameWithWildcard
		{ after(grammarAccess.getImportAccess().getImportedNamespaceQualifiedNameWithWildcardParserRuleCall_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__AccessLevelAssignment_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getClassAccess().getAccessLevelAccessLevelEnumRuleCall_0_0()); }
		ruleAccessLevel
		{ after(grammarAccess.getClassAccess().getAccessLevelAccessLevelEnumRuleCall_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__AbstractAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getClassAccess().getAbstractAbstractKeyword_1_0()); }
		(
			{ before(grammarAccess.getClassAccess().getAbstractAbstractKeyword_1_0()); }
			'abstract'
			{ after(grammarAccess.getClassAccess().getAbstractAbstractKeyword_1_0()); }
		)
		{ after(grammarAccess.getClassAccess().getAbstractAbstractKeyword_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__NameAssignment_3
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getClassAccess().getNameIDTerminalRuleCall_3_0()); }
		RULE_ID
		{ after(grammarAccess.getClassAccess().getNameIDTerminalRuleCall_3_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__SuperClassAssignment_4_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getClassAccess().getSuperClassClassCrossReference_4_1_0()); }
		(
			{ before(grammarAccess.getClassAccess().getSuperClassClassQualifiedNameParserRuleCall_4_1_0_1()); }
			ruleQualifiedName
			{ after(grammarAccess.getClassAccess().getSuperClassClassQualifiedNameParserRuleCall_4_1_0_1()); }
		)
		{ after(grammarAccess.getClassAccess().getSuperClassClassCrossReference_4_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__ImplementsAssignment_5_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getClassAccess().getImplementsInterfaceCrossReference_5_1_0()); }
		(
			{ before(grammarAccess.getClassAccess().getImplementsInterfaceQualifiedNameParserRuleCall_5_1_0_1()); }
			ruleQualifiedName
			{ after(grammarAccess.getClassAccess().getImplementsInterfaceQualifiedNameParserRuleCall_5_1_0_1()); }
		)
		{ after(grammarAccess.getClassAccess().getImplementsInterfaceCrossReference_5_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__ImplementsAssignment_5_2_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getClassAccess().getImplementsInterfaceCrossReference_5_2_1_0()); }
		(
			{ before(grammarAccess.getClassAccess().getImplementsInterfaceQualifiedNameParserRuleCall_5_2_1_0_1()); }
			ruleQualifiedName
			{ after(grammarAccess.getClassAccess().getImplementsInterfaceQualifiedNameParserRuleCall_5_2_1_0_1()); }
		)
		{ after(grammarAccess.getClassAccess().getImplementsInterfaceCrossReference_5_2_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Class__MembersAssignment_7
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getClassAccess().getMembersMemberParserRuleCall_7_0()); }
		ruleMember
		{ after(grammarAccess.getClassAccess().getMembersMemberParserRuleCall_7_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__AccessLevelAssignment_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getInterfaceAccess().getAccessLevelAccessLevelEnumRuleCall_0_0()); }
		ruleAccessLevel
		{ after(grammarAccess.getInterfaceAccess().getAccessLevelAccessLevelEnumRuleCall_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__NameAssignment_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getInterfaceAccess().getNameIDTerminalRuleCall_2_0()); }
		RULE_ID
		{ after(grammarAccess.getInterfaceAccess().getNameIDTerminalRuleCall_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__ImplementsAssignment_3_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getInterfaceAccess().getImplementsInterfaceCrossReference_3_1_0()); }
		(
			{ before(grammarAccess.getInterfaceAccess().getImplementsInterfaceQualifiedNameParserRuleCall_3_1_0_1()); }
			ruleQualifiedName
			{ after(grammarAccess.getInterfaceAccess().getImplementsInterfaceQualifiedNameParserRuleCall_3_1_0_1()); }
		)
		{ after(grammarAccess.getInterfaceAccess().getImplementsInterfaceCrossReference_3_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__ImplementsAssignment_3_2_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getInterfaceAccess().getImplementsInterfaceCrossReference_3_2_1_0()); }
		(
			{ before(grammarAccess.getInterfaceAccess().getImplementsInterfaceQualifiedNameParserRuleCall_3_2_1_0_1()); }
			ruleQualifiedName
			{ after(grammarAccess.getInterfaceAccess().getImplementsInterfaceQualifiedNameParserRuleCall_3_2_1_0_1()); }
		)
		{ after(grammarAccess.getInterfaceAccess().getImplementsInterfaceCrossReference_3_2_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Interface__MembersAssignment_5
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getInterfaceAccess().getMembersMemberParserRuleCall_5_0()); }
		ruleMember
		{ after(grammarAccess.getInterfaceAccess().getMembersMemberParserRuleCall_5_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__AccessAssignment_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMethodAccess().getAccessAccessLevelEnumRuleCall_0_0()); }
		ruleAccessLevel
		{ after(grammarAccess.getMethodAccess().getAccessAccessLevelEnumRuleCall_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__AbstractAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMethodAccess().getAbstractAbstractKeyword_1_0()); }
		(
			{ before(grammarAccess.getMethodAccess().getAbstractAbstractKeyword_1_0()); }
			'abstract'
			{ after(grammarAccess.getMethodAccess().getAbstractAbstractKeyword_1_0()); }
		)
		{ after(grammarAccess.getMethodAccess().getAbstractAbstractKeyword_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__StaticAssignment_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMethodAccess().getStaticStaticKeyword_2_0()); }
		(
			{ before(grammarAccess.getMethodAccess().getStaticStaticKeyword_2_0()); }
			'static'
			{ after(grammarAccess.getMethodAccess().getStaticStaticKeyword_2_0()); }
		)
		{ after(grammarAccess.getMethodAccess().getStaticStaticKeyword_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__TypeRefAssignment_3
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMethodAccess().getTypeRefTypeRefParserRuleCall_3_0()); }
		ruleTypeRef
		{ after(grammarAccess.getMethodAccess().getTypeRefTypeRefParserRuleCall_3_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__NameAssignment_4
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMethodAccess().getNameIDTerminalRuleCall_4_0()); }
		RULE_ID
		{ after(grammarAccess.getMethodAccess().getNameIDTerminalRuleCall_4_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__ParamsAssignment_6_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMethodAccess().getParamsParameterParserRuleCall_6_0_0()); }
		ruleParameter
		{ after(grammarAccess.getMethodAccess().getParamsParameterParserRuleCall_6_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__ParamsAssignment_6_1_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMethodAccess().getParamsParameterParserRuleCall_6_1_1_0()); }
		ruleParameter
		{ after(grammarAccess.getMethodAccess().getParamsParameterParserRuleCall_6_1_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Method__BodyAssignment_8_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMethodAccess().getBodyBlockParserRuleCall_8_0_0()); }
		ruleBlock
		{ after(grammarAccess.getMethodAccess().getBodyBlockParserRuleCall_8_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Parameter__TypeRefAssignment_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getParameterAccess().getTypeRefTypeRefParserRuleCall_0_0()); }
		ruleTypeRef
		{ after(grammarAccess.getParameterAccess().getTypeRefTypeRefParserRuleCall_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Parameter__NameAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getParameterAccess().getNameIDTerminalRuleCall_1_0()); }
		RULE_ID
		{ after(grammarAccess.getParameterAccess().getNameIDTerminalRuleCall_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__AccessAssignment_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getFieldAccess().getAccessAccessLevelEnumRuleCall_0_0()); }
		ruleAccessLevel
		{ after(grammarAccess.getFieldAccess().getAccessAccessLevelEnumRuleCall_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__TypeRefAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getFieldAccess().getTypeRefTypeRefParserRuleCall_1_0()); }
		ruleTypeRef
		{ after(grammarAccess.getFieldAccess().getTypeRefTypeRefParserRuleCall_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__NameAssignment_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getFieldAccess().getNameIDTerminalRuleCall_2_0()); }
		RULE_ID
		{ after(grammarAccess.getFieldAccess().getNameIDTerminalRuleCall_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Field__DefaultValueAssignment_3_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getFieldAccess().getDefaultValueExpressionParserRuleCall_3_1_0()); }
		ruleExpression
		{ after(grammarAccess.getFieldAccess().getDefaultValueExpressionParserRuleCall_3_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Block__StatementsAssignment_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getBlockAccess().getStatementsStatementParserRuleCall_2_0()); }
		ruleStatement
		{ after(grammarAccess.getBlockAccess().getStatementsStatementParserRuleCall_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__PrintStatement__ExpressionAssignment_6
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getPrintStatementAccess().getExpressionExpressionParserRuleCall_6_0()); }
		ruleExpression
		{ after(grammarAccess.getPrintStatementAccess().getExpressionExpressionParserRuleCall_6_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Return__ExpressionAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getReturnAccess().getExpressionExpressionParserRuleCall_1_0()); }
		ruleExpression
		{ after(grammarAccess.getReturnAccess().getExpressionExpressionParserRuleCall_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__ExpressionAssignment_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getIfStatementAccess().getExpressionExpressionParserRuleCall_2_0()); }
		ruleExpression
		{ after(grammarAccess.getIfStatementAccess().getExpressionExpressionParserRuleCall_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__ThenBlockAssignment_4
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getIfStatementAccess().getThenBlockBlockParserRuleCall_4_0()); }
		ruleBlock
		{ after(grammarAccess.getIfStatementAccess().getThenBlockBlockParserRuleCall_4_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__IfStatement__ElseBlockAssignment_5_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getIfStatementAccess().getElseBlockBlockParserRuleCall_5_1_0()); }
		ruleBlock
		{ after(grammarAccess.getIfStatementAccess().getElseBlockBlockParserRuleCall_5_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__ConditionAssignment_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getWhileStatementAccess().getConditionExpressionParserRuleCall_2_0()); }
		ruleExpression
		{ after(grammarAccess.getWhileStatementAccess().getConditionExpressionParserRuleCall_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__WhileStatement__BlockAssignment_4
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getWhileStatementAccess().getBlockBlockParserRuleCall_4_0()); }
		ruleBlock
		{ after(grammarAccess.getWhileStatementAccess().getBlockBlockParserRuleCall_4_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__DeclarationAssignment_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getForStatementAccess().getDeclarationAssignmentParserRuleCall_2_0()); }
		ruleAssignment
		{ after(grammarAccess.getForStatementAccess().getDeclarationAssignmentParserRuleCall_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__ConditionAssignment_4
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getForStatementAccess().getConditionExpressionParserRuleCall_4_0()); }
		ruleExpression
		{ after(grammarAccess.getForStatementAccess().getConditionExpressionParserRuleCall_4_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__ProgressionAssignment_6
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getForStatementAccess().getProgressionAssignmentParserRuleCall_6_0()); }
		ruleAssignment
		{ after(grammarAccess.getForStatementAccess().getProgressionAssignmentParserRuleCall_6_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__ForStatement__BlockAssignment_8
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getForStatementAccess().getBlockBlockParserRuleCall_8_0()); }
		ruleBlock
		{ after(grammarAccess.getForStatementAccess().getBlockBlockParserRuleCall_8_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__ClassRef__ReferencedClassAssignment
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getClassRefAccess().getReferencedClassTypeDeclarationCrossReference_0()); }
		(
			{ before(grammarAccess.getClassRefAccess().getReferencedClassTypeDeclarationQualifiedNameParserRuleCall_0_1()); }
			ruleQualifiedName
			{ after(grammarAccess.getClassRefAccess().getReferencedClassTypeDeclarationQualifiedNameParserRuleCall_0_1()); }
		)
		{ after(grammarAccess.getClassRefAccess().getReferencedClassTypeDeclarationCrossReference_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__VariableDeclaration__TypeRefAssignment_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getVariableDeclarationAccess().getTypeRefTypeRefParserRuleCall_0_0()); }
		ruleTypeRef
		{ after(grammarAccess.getVariableDeclarationAccess().getTypeRefTypeRefParserRuleCall_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__VariableDeclaration__NameAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getVariableDeclarationAccess().getNameIDTerminalRuleCall_1_0()); }
		RULE_ID
		{ after(grammarAccess.getVariableDeclarationAccess().getNameIDTerminalRuleCall_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Assignment__AssigneeAssignment_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getAssignmentAccess().getAssigneeAssigneeParserRuleCall_0_0()); }
		ruleAssignee
		{ after(grammarAccess.getAssignmentAccess().getAssigneeAssigneeParserRuleCall_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Assignment__ValueAssignment_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getAssignmentAccess().getValueExpressionParserRuleCall_2_0()); }
		ruleExpression
		{ after(grammarAccess.getAssignmentAccess().getValueExpressionParserRuleCall_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Or__RightAssignment_1_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getOrAccess().getRightAndParserRuleCall_1_2_0()); }
		ruleAnd
		{ after(grammarAccess.getOrAccess().getRightAndParserRuleCall_1_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__And__RightAssignment_1_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getAndAccess().getRightEqualityParserRuleCall_1_2_0()); }
		ruleEquality
		{ after(grammarAccess.getAndAccess().getRightEqualityParserRuleCall_1_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Equality__RightAssignment_1_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getEqualityAccess().getRightComparisonParserRuleCall_1_1_0()); }
		ruleComparison
		{ after(grammarAccess.getEqualityAccess().getRightComparisonParserRuleCall_1_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Comparison__RightAssignment_1_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getComparisonAccess().getRightPlusOrMinusParserRuleCall_1_1_0()); }
		rulePlusOrMinus
		{ after(grammarAccess.getComparisonAccess().getRightPlusOrMinusParserRuleCall_1_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__PlusOrMinus__RightAssignment_1_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getPlusOrMinusAccess().getRightMulOrDivParserRuleCall_1_1_0()); }
		ruleMulOrDiv
		{ after(grammarAccess.getPlusOrMinusAccess().getRightMulOrDivParserRuleCall_1_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__MulOrDiv__RightAssignment_1_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getMulOrDivAccess().getRightArrayAccessParserRuleCall_1_1_0()); }
		ruleArrayAccess
		{ after(grammarAccess.getMulOrDivAccess().getRightArrayAccessParserRuleCall_1_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__ArrayAccess__IndexAssignment_1_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getArrayAccessAccess().getIndexExpressionParserRuleCall_1_2_0()); }
		ruleExpression
		{ after(grammarAccess.getArrayAccessAccess().getIndexExpressionParserRuleCall_1_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__ExpressionAssignment_1_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getPrimaryAccess().getExpressionPrimaryParserRuleCall_1_2_0()); }
		rulePrimary
		{ after(grammarAccess.getPrimaryAccess().getExpressionPrimaryParserRuleCall_1_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Primary__ExpressionAssignment_2_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getPrimaryAccess().getExpressionPrimaryParserRuleCall_2_2_0()); }
		rulePrimary
		{ after(grammarAccess.getPrimaryAccess().getExpressionPrimaryParserRuleCall_2_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__FieldAssignment_1_0_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getSelectionExpressionAccess().getFieldFieldCrossReference_1_0_2_0()); }
		(
			{ before(grammarAccess.getSelectionExpressionAccess().getFieldFieldIDTerminalRuleCall_1_0_2_0_1()); }
			RULE_ID
			{ after(grammarAccess.getSelectionExpressionAccess().getFieldFieldIDTerminalRuleCall_1_0_2_0_1()); }
		)
		{ after(grammarAccess.getSelectionExpressionAccess().getFieldFieldCrossReference_1_0_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__MethodAssignment_1_1_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getSelectionExpressionAccess().getMethodMethodCrossReference_1_1_2_0()); }
		(
			{ before(grammarAccess.getSelectionExpressionAccess().getMethodMethodIDTerminalRuleCall_1_1_2_0_1()); }
			RULE_ID
			{ after(grammarAccess.getSelectionExpressionAccess().getMethodMethodIDTerminalRuleCall_1_1_2_0_1()); }
		)
		{ after(grammarAccess.getSelectionExpressionAccess().getMethodMethodCrossReference_1_1_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__ArgsAssignment_1_1_4_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getSelectionExpressionAccess().getArgsExpressionParserRuleCall_1_1_4_0_0()); }
		ruleExpression
		{ after(grammarAccess.getSelectionExpressionAccess().getArgsExpressionParserRuleCall_1_1_4_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__SelectionExpression__ArgsAssignment_1_1_4_1_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getSelectionExpressionAccess().getArgsExpressionParserRuleCall_1_1_4_1_1_0()); }
		ruleExpression
		{ after(grammarAccess.getSelectionExpressionAccess().getArgsExpressionParserRuleCall_1_1_4_1_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__ValueAssignment_0_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getValueSTRINGTerminalRuleCall_0_1_0()); }
		RULE_STRING
		{ after(grammarAccess.getTerminalExpressionAccess().getValueSTRINGTerminalRuleCall_0_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__ValueAssignment_1_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getValueINTTerminalRuleCall_1_1_0()); }
		RULE_INT
		{ after(grammarAccess.getTerminalExpressionAccess().getValueINTTerminalRuleCall_1_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__ValueAssignment_2_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getValueAlternatives_2_1_0()); }
		(rule__TerminalExpression__ValueAlternatives_2_1_0)
		{ after(grammarAccess.getTerminalExpressionAccess().getValueAlternatives_2_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__TypeAssignment_6_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getTypeClassCrossReference_6_2_0()); }
		(
			{ before(grammarAccess.getTerminalExpressionAccess().getTypeClassIDTerminalRuleCall_6_2_0_1()); }
			RULE_ID
			{ after(grammarAccess.getTerminalExpressionAccess().getTypeClassIDTerminalRuleCall_6_2_0_1()); }
		)
		{ after(grammarAccess.getTerminalExpressionAccess().getTypeClassCrossReference_6_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__ArgsAssignment_6_4_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getArgsExpressionParserRuleCall_6_4_0_0()); }
		ruleExpression
		{ after(grammarAccess.getTerminalExpressionAccess().getArgsExpressionParserRuleCall_6_4_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__ArgsAssignment_6_4_1_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getArgsExpressionParserRuleCall_6_4_1_1_0()); }
		ruleExpression
		{ after(grammarAccess.getTerminalExpressionAccess().getArgsExpressionParserRuleCall_6_4_1_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__TypeAssignment_7_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getTypeTypeRefParserRuleCall_7_2_0()); }
		ruleTypeRef
		{ after(grammarAccess.getTerminalExpressionAccess().getTypeTypeRefParserRuleCall_7_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__SizeAssignment_7_4
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getSizeExpressionParserRuleCall_7_4_0()); }
		ruleExpression
		{ after(grammarAccess.getTerminalExpressionAccess().getSizeExpressionParserRuleCall_7_4_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__TerminalExpression__SymbolAssignment_8_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTerminalExpressionAccess().getSymbolSymbolCrossReference_8_1_0()); }
		(
			{ before(grammarAccess.getTerminalExpressionAccess().getSymbolSymbolIDTerminalRuleCall_8_1_0_1()); }
			RULE_ID
			{ after(grammarAccess.getTerminalExpressionAccess().getSymbolSymbolIDTerminalRuleCall_8_1_0_1()); }
		)
		{ after(grammarAccess.getTerminalExpressionAccess().getSymbolSymbolCrossReference_8_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;

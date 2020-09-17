/**
 * generated by Xtext 2.19.0
 */
package fr.cea.nabla.nabla;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Function Arg</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link fr.cea.nabla.nabla.FunctionArg#getInTypes <em>In Types</em>}</li>
 *   <li>{@link fr.cea.nabla.nabla.FunctionArg#getReturnType <em>Return Type</em>}</li>
 * </ul>
 *
 * @see fr.cea.nabla.nabla.NablaPackage#getFunctionArg()
 * @model
 * @generated
 */
public interface FunctionArg extends EObject
{
  /**
   * Returns the value of the '<em><b>In Types</b></em>' attribute list.
   * The list contents are of type {@link fr.cea.nabla.nabla.BasicType}.
   * The literals are from the enumeration {@link fr.cea.nabla.nabla.BasicType}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>In Types</em>' attribute list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>In Types</em>' attribute list.
   * @see fr.cea.nabla.nabla.BasicType
   * @see fr.cea.nabla.nabla.NablaPackage#getFunctionArg_InTypes()
   * @model unique="false"
   * @generated
   */
  EList<BasicType> getInTypes();

  /**
   * Returns the value of the '<em><b>Return Type</b></em>' attribute.
   * The literals are from the enumeration {@link fr.cea.nabla.nabla.BasicType}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Return Type</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Return Type</em>' attribute.
   * @see fr.cea.nabla.nabla.BasicType
   * @see #setReturnType(BasicType)
   * @see fr.cea.nabla.nabla.NablaPackage#getFunctionArg_ReturnType()
   * @model
   * @generated
   */
  BasicType getReturnType();

  /**
   * Sets the value of the '{@link fr.cea.nabla.nabla.FunctionArg#getReturnType <em>Return Type</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Return Type</em>' attribute.
   * @see fr.cea.nabla.nabla.BasicType
   * @see #getReturnType()
   * @generated
   */
  void setReturnType(BasicType value);

} // FunctionArg

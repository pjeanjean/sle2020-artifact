/**
 * generated by Xtext 2.19.0
 */
package fr.cea.nabla.nabla;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Var Ref</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link fr.cea.nabla.nabla.VarRef#getVariable <em>Variable</em>}</li>
 *   <li>{@link fr.cea.nabla.nabla.VarRef#getSpaceIterators <em>Space Iterators</em>}</li>
 *   <li>{@link fr.cea.nabla.nabla.VarRef#getTimeIterator <em>Time Iterator</em>}</li>
 *   <li>{@link fr.cea.nabla.nabla.VarRef#getFields <em>Fields</em>}</li>
 * </ul>
 *
 * @see fr.cea.nabla.nabla.NablaPackage#getVarRef()
 * @model
 * @generated
 */
public interface VarRef extends Expression
{
  /**
   * Returns the value of the '<em><b>Variable</b></em>' reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Variable</em>' reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Variable</em>' reference.
   * @see #setVariable(Var)
   * @see fr.cea.nabla.nabla.NablaPackage#getVarRef_Variable()
   * @model
   * @generated
   */
  Var getVariable();

  /**
   * Sets the value of the '{@link fr.cea.nabla.nabla.VarRef#getVariable <em>Variable</em>}' reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Variable</em>' reference.
   * @see #getVariable()
   * @generated
   */
  void setVariable(Var value);

  /**
   * Returns the value of the '<em><b>Space Iterators</b></em>' containment reference list.
   * The list contents are of type {@link fr.cea.nabla.nabla.IteratorRangeOrRef}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Space Iterators</em>' containment reference list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Space Iterators</em>' containment reference list.
   * @see fr.cea.nabla.nabla.NablaPackage#getVarRef_SpaceIterators()
   * @model containment="true"
   * @generated
   */
  EList<IteratorRangeOrRef> getSpaceIterators();

  /**
   * Returns the value of the '<em><b>Time Iterator</b></em>' containment reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Time Iterator</em>' containment reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Time Iterator</em>' containment reference.
   * @see #setTimeIterator(TimeIteratorRef)
   * @see fr.cea.nabla.nabla.NablaPackage#getVarRef_TimeIterator()
   * @model containment="true"
   * @generated
   */
  TimeIteratorRef getTimeIterator();

  /**
   * Sets the value of the '{@link fr.cea.nabla.nabla.VarRef#getTimeIterator <em>Time Iterator</em>}' containment reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Time Iterator</em>' containment reference.
   * @see #getTimeIterator()
   * @generated
   */
  void setTimeIterator(TimeIteratorRef value);

  /**
   * Returns the value of the '<em><b>Fields</b></em>' attribute list.
   * The list contents are of type {@link java.lang.String}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Fields</em>' attribute list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Fields</em>' attribute list.
   * @see fr.cea.nabla.nabla.NablaPackage#getVarRef_Fields()
   * @model unique="false"
   * @generated
   */
  EList<String> getFields();

} // VarRef
